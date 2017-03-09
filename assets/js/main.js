jQuery(function($){
	var resources;
	var UA = createUA();
	
	$.getJSON("/assets/json/resources.json").then(function(data){
		resources = data;
		return resources.loading;
	})
	// 以下loading画像読み込み処理
	.then(function(loadingResources){
		var imgs   = loadingResources.img;
		var styles = loadingResources.css;
		
		return $.when(loadBinary(imgs), loadText(styles)).then(function(imgsBlob, styleList){
			var imgPathList = imgsBlob.map(function(blob){
				return URL.createObjectURL(blob);
			});
			
			styleList
				.map(function(style){
						console.log(style);
					return style.replace(/\$\[([0-9]+)\]/g, function($0, $1){
						var img = imgPathList[+$1];
						console.log($0, $1);
						return img || $0;
					});
				})
				.forEach(function(style){
						console.log(style);
					var ele = $("<style></style>").text(style);
					$("head")
						.append(ele);
				});
		}).then(function(){
			// 初期アニメーション開始
			$("#loadingContainer").addClass("start");
		});
	})
	// 以下メインコンテンツリソース読み込み処理
	.then(function(){
		var contentsResources = (UA.isTablet || UA.isMobile) ? resources.mobile: resources.pc;
		var tags = contentsResources.tag;
		var imgs = contentsResources.img;
		
		// ローディング1秒待機保証
		var sleepDfd = new $.Deferred();
		setTimeout(function(){ sleepDfd.resolve(); }, 1000);
		
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
				var filename = path.replace(/.*?([^\/]+)\.png$/, "$1");
				obj[filename] = urls[i];
				
				return obj;
			}, {});
		});
		
		// マウント処理
		return $.when(imgDfd).then(function(imgs){
			var mountDfd = new $.Deferred();
			riot.mount("app", { imgs: imgs, mountDfd: mountDfd, menu: resources.menu });
			
			//$("app").addClass("loaded");
			return $.when(mountDfd.promise(), sleepDfd.promise());
		});
	})
	// マウント後処理
	.then(function(){
		$("#loadingContainer").addClass("loaded");
		
		// アニメーション1秒待機保証
		var sleepDfd = new $.Deferred();
		setTimeout(function(){ sleepDfd.resolve(); }, 1000);
		
		return sleepDfd;
	})
	.then(function(){
		$("#loadingContainer, app").addClass("end");
		
		// アニメーション1秒待機保証
		var sleepDfd = new $.Deferred();
		setTimeout(function(){ sleepDfd.resolve(); }, 1000);
		
		return sleepDfd;
	})
	.then(function(){
		//$("#loadingContainer").css("display", "none");
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
				url: new URL(path, location.origin).href,
				dataType: type,
			}).then(function(bin){
				return bin;
			});
		})).then(function(){
			return Array.prototype.slice.call(arguments);
		});
	}
});