<side-menu class="{visible: this.visible}">
	<ul style="background-image: url({opts.imgs.menu_grid})">
		<li each="{value,key in opts.menu}"><a href="#{value.name}"><img src="{parent.opts.imgs['menu_'+value.name]}"></a></li>
	</ul>
	<style>
		:scope {
			line-height: 1;
			transform: translateY(calc(-100% - 10px));
			transition-property: transform;
			transition-duration: 0.5s;
			transition-timing-function: ease;
		}
		:scope.visible {
			transform: translateY(0%);
		}
		:scope > ul{
			margin-left: 30px;
			border: solid 1px rgb(129, 193, 228);
			border-top: none;
			box-shadow: rgb(175, 197, 196) 10px 10px 5px -5px;
			background-size: 30px;
			background-repeat: repeat-y;
			background-position: right bottom;
		}
		:scope > ul > li {
			overflow: hidden;
			text-align: right;
			margin-right: 19px;
			border: solid 1px rgb(129, 193, 228);
			border-right: none;
		}
		:scope > ul > li > a {
			display: inline-block;
			width: 100%;
			background-color: transparent;
			transition-property: background-color;
			transition-duration: 0.3s;
			transition-timing-function: ease;
		}
		:scope > ul > li > a:hover {
			background-color: rgb(53, 35, 35);
		}
		:scope > ul > li > a > img {
			width: 190px;
			vertical-align: bottom;
			margin-left: 5px;
			margin-bottom: -20px;
		}
	</style>
	
	<script>
		var module = this;
		var scrollMediator = opts.scrollMediator;
		
		scrollMediator.on("top-visible-change", function(eve){
			module.update({visible: eve.isLeave});
		});
		
		module.on("mount", function(){
			$("head").append('<'+'script async src="//platform.twitter.com/widgets.js" charset="utf-8"><'+'/script>');
		});
	</script>
</side-menu>