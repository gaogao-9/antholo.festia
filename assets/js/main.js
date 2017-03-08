jQuery(function($){
	var resources;
	var UA = createUA();
	
	$.getJSON("/assets/json/resources.json").then(function(data){
		resources = data;
		return resources.loading;
	})
	// 以下loading画像読み込み処理
	.then(function(loadingResources){
		var imgs = loadingResources.img;
		loadBinary(imgs).then(function(imgsBlob){
			imgsBlob.map(function(blob){
				return URL.createObjectURL(blob);
			}).map(function(url, i){
				return $(new Image())
					.attr({
						src: url,
						class: ["animation", ("00"+i).slice(-2)].join(" "),
					})
					.on("load", function(eve){
						URL.revokeObjectURL(url);
					});
			}).forEach(function(ele){
				$("#loadingContainer")
					.find(".imgContainer")
					.append(ele);
			});
		});
	})
	// 以下メインコンテンツリソース読み込み処理
	.then(function(){
		var contentsResources = (UA.isTablet || UA.isMobile) ? resources.mobile: resources.pc;
		var tags = contentsResources.tag;
		var imgs = contentsResources.img;
		
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
			var mountDfd = new $.Deferred().promise();
			riot.mount("app", { imgs: imgs, mountDfd: mountDfd, menu: resources.menu });
			
			return mountDfd;
		});
	})
	// マウント後の後処理
	.then(function(){
		$("#loadingContainer").css("display", "none");
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
	
	function loadBinary(pathList){
		if(!pathList.length) return $.Deferred().resolve([]);
		
		return $.when.apply($, pathList.map(function(path){
			return $.get({
				url: new URL(path, location.origin).href,
				dataType: "binary",
			}).then(function(bin){
				return bin;
			});
		})).then(function(){
			return Array.prototype.slice.call(arguments);
		});
	}
});