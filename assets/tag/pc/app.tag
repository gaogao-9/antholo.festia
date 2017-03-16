<app>
	
	<virtual each="{value,key in opts.menu.slice(0,1)}">
		<div data-is="{value.name}" menu="{parent.opts.menu}" imgs="{parent.opts.imgs}" dfd="{parent.dfdList[key]}" scroll-mediator="{parent.scrollMediator}" id="{value.name}"></div>
	</virtual>
	<div class="container {visible: this.visible}">
		<div class="contents">
			<div each="{value,key in opts.menu.slice(1)}" data-is="{value.name}" menu="{parent.opts.menu}" imgs="{parent.opts.imgs}" dfd="{parent.dfdList[key+1]}" scroll-mediator="{parent.scrollMediator}" id="{value.name}"></div>
		</div><!--
		--><side-menu menu="{opts.menu}" imgs="{opts.imgs}" scroll-mediator="{this.scrollMediator}"></side-menu>
	</div>
	
	<style>
	:scope {
		display: block;
		overflow: hidden;
		word-wrap:break-word;
		overflow-wrap:break-word;
		width: 100%;
		height: 100vh;
	}
	:scope.end {
		overflow: visible;
		height: auto;
	}
	:scope > div:first-child {
		height: 100vh;
		width: 100%;
		min-width: 1000px;
	}
	:scope > div.container {
		margin: 0 auto;
		width: 1000px;
		overflow: hidden;
	}
	:scope > div.container.visible {
		overflow: visible;
	}
	:scope > div.container > * {
		display: inline-block;
		vertical-align: top;
	}
	:scope > div.container > div.contents {
		width: 750px;
	}
	:scope > div.container > side-menu {
		position: -webkit-sticky;
		position: sticky;
		top: 0;
		width: 250px;
	}
	</style>
	<script>
		var module = this;
		
		opts.endDfd.then(function(){
			var hasHash = opts.menu.filter(function(item){
				return "#"+item.name === location.hash;
			}).length;
			
			if(hasHash){
				$("html,body").animate({scrollTop:$(location.hash).offset().top});
			}
			
			$(document).on("click", "a", function(eve){
				if(!eve.currentTarget.hash) return;
				if(eve.currentTarget.host !== location.host) return;
				
				$("html,body").animate({scrollTop:$(eve.currentTarget.hash).offset().top});
			});
		;
		});
		
		module.on("before-mount", function(){
			module.scrollMediator = new ScrollMediator();
			
			module.scrollMediator.on("top-visible-change", function(eve){
				module.update({visible: eve.isLeave});
			});
			
		});
		
		module.on("before-mount", function(){
			module.dfdList = opts.menu.map(function(item){
				return new $.Deferred();
			});
			console.log(module.dfdList);
		});
		
		module.on("mount", function(){
			console.log("it app");
			$.when.apply($, module.dfdList).then(function(){
				var arg = opts.scrollSettings.map(function(obj){
					return $.extend(obj, {
						name: obj.name,
						ele: $("#"+obj.name),
					});
				});
				
				module.scrollMediator.start(arg);
			}).then(function(){
				opts.mountDfd.resolve();
			});
		});
		
		module.on("mount", function(){
			$("side-menu").fixedsticky();
		});
	</script>
</app>