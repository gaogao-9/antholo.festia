jQuery(function($){
	var resources, scrollSettings, memberList, endDfd;
	var UA = createUA();
	
	$.when(
		$.getJSON("/assets/json/resources.json"),
		$.getJSON("/assets/json/scrollSettings.json"),
		$.getJSON("/assets/json/memberList.json")
	).catch(function(obj, message, error){
		throw error;
	}).then(function(_resources, _scrollSettings, _memberList){
		resources      = _resources[0];
		scrollSettings = _scrollSettings[0];
		memberList = _memberList[0];
		return resources.loading;
	})
	// 以下loading画像読み込み処理
	.then(function(loadingResources){
		if(UA.isTablet || UA.isMobile) return;
		
		var imgs   = loadingResources.img;
		var styles = loadingResources.css;
		
		return $.when(loadBinary(imgs), loadText(styles)).then(function(imgsBlob, styleList){
			var imgPathList = imgs
				.reduce(function(obj, path, i){
					var filename = path.replace(/.*?([^\/]+)\.(?:jpg|png)$/, "$1");
					obj[filename] = URL.createObjectURL(imgsBlob[i]);
					
					return obj;
				}, {});
			
			styleList
				.map(function(style){
					return style.replace(/\$\[([^\]]+)\]/ig, function($0, $1){
						var img = imgPathList[$1];
						return img || $0;
					});
				})
				.forEach(function(style){
					var ele = $("<style></style>").text(style);
					$("head")
						.append(ele);
				});
		}).then(function(){
			if(!UA.isTablet && !UA.isMobile){
				// 初期アニメーション開始
				$("#loadingContainer").addClass("start");
			}
			else{
				// すまぽんの場合はアニメーションなんてなかったのスタイルを
				$("#loadingContainer").remove();
			}
		});
	})
	// 以下メインコンテンツリソース読み込み処理
	.then(function(){
		var contentsResources = (UA.isTablet || UA.isMobile) ? resources.mobile: resources.pc;
		var tags   = contentsResources.tag;
		var imgs   = contentsResources.img;
		var styles = contentsResources.style;
		
		// ローディング0.3秒待機保証
		var sleepDfd = new $.Deferred();
		setTimeout(function(){ sleepDfd.resolve(); }, 500);
		
		// タグの埋め込み
		tags.map(function(src){
			return $("<script></script>")
				.attr({
					src: src,
					type: "riot/tag",
				});
		}).forEach(function(ele){
			$("head").append(ele);
		});
		
		// 画像の読み込み
		var imgDfd = loadBinary(imgs).then(function(imgsBlob){
			var urls = imgsBlob.map(function(blob){
				return URL.createObjectURL(blob);
			});
			
			return imgs.reduce(function(obj, path, i){
				var filename = path.replace(/.*?([^\/]+)\/([^\/]+)\.(?:jpg|png)$/, "$1_$2");
				obj[filename] = urls[i];
				
				return obj;
			}, {});
		});
		
		// スタイルの埋め込み
		styles.forEach(function(style){
			$("head").append('<link href="' + style + '" rel="stylesheet">');
		});
		
		// スクロールバー幅の取得
		var scrollBarSize = function scrollBarSize() {
			var W = 1000, H = 1000;
			
			var iframe = document.createElement("iframe");
			    iframe.frameBorder = 0;
			    iframe.width = W;
			    iframe.height = H;
			
			with (iframe.style) {
				position = "absolute";
				top = "0px";
				left = "-" + (W * 2) + "px";
			}
			
			document.body.appendChild(iframe);
			var win = iframe.contentWindow,
			    doc = win.document;
			doc.open();
			doc.write('<!DOCTYPE html><html><head><style type="text/css">html,body,div{margin:0;padding:0;}div{width:'+(W*2)+'px;height:'+(H*2)+'px;}</style></head><body><div></div></body></html>');
			doc.close();
			
			var res = {
				width: W - doc.documentElement.clientHeight,
				height: H - doc.documentElement.clientWidth
			};
			
			document.body.removeChild(iframe);
			
			return res;
		}();
		
		// マウント処理
		return $.when(imgDfd).then(function(imgs){
			var mountDfd = new $.Deferred();
			endDfd = new $.Deferred();
			riot.mount("app", { imgs: imgs, mountDfd: mountDfd, endDfd: endDfd, menu: resources.menu, scrollSettings: scrollSettings, memberList: memberList, scrollBarSize: scrollBarSize });
			
			return $.when(mountDfd.promise(), sleepDfd.promise());
		});
	})
	// マウント後処理
	.then(function(){
		if(UA.isTablet || UA.isMobile) return $.Deferred().reject("Mobile Skipped");
		
		$("#loadingContainer, app").addClass("loaded");
		
		// アニメーション0.6秒待機保証
		var sleepDfd = new $.Deferred();
		setTimeout(function(){ sleepDfd.resolve(); }, 600);
		
		return sleepDfd;
	})
	.then(function(){
		$("#loadingContainer, app").addClass("end");
		endDfd.resolve();
		
		// アニメーション1秒待機保証
		var sleepDfd = new $.Deferred();
		setTimeout(function(){ sleepDfd.resolve(); }, 1000);
		
		return sleepDfd;
	})
	.then(function(){
		$("#loadingContainer").remove();
	})
	.catch(function(err){
		if(err === "Mobile Skipped") return;
		console.error((err && err.stack) || err);
	});
	
	
	// 以下ユーティリティ
	function createUA(){
		var u = window.navigator.userAgent.toLowerCase();
		return {
			isTablet: (u.indexOf("windows") != -1 && u.indexOf("touch") != -1 && u.indexOf("tablet pc") == -1) 
				|| u.indexOf("ipad") != -1
				|| (u.indexOf("android") != -1 && u.indexOf("mobile") == -1)
				|| (u.indexOf("firefox") != -1 && u.indexOf("tablet") != -1)
				|| u.indexOf("kindle") != -1
				|| u.indexOf("silk") != -1
				|| u.indexOf("playbook") != -1,
			isMobile: (u.indexOf("windows") != -1 && u.indexOf("phone") != -1)
				|| u.indexOf("iphone") != -1
				|| u.indexOf("ipod") != -1
				|| (u.indexOf("android") != -1 && u.indexOf("mobile") != -1)
				|| (u.indexOf("firefox") != -1 && u.indexOf("mobile") != -1)
				|| u.indexOf("blackberry") != -1
		}
	}
	
	function loadText(pathList){
		return load(pathList, "text");
	}
	
	function loadBinary(pathList){
		return load(pathList, "binary");
	}
	
	function load(pathList, type){
		if(!pathList || !pathList.length) return $.Deferred().resolve([]);
		
		return $.when.apply($, pathList.map(function(path){
			return $.get({
				url: $("<a>", { href: path })[0].href,
				dataType: type,
			}).then(function(bin){
				return bin;
			});
		})).then(function(){
			return Array.prototype.slice.call(arguments);
		});
	}
});
