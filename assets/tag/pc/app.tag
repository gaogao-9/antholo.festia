<app>
	<virtual each="{value,key in opts.menu}">
		<div data-is="{value.name}"></div>
	</virtual>
	
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
	:scope > div {
		margin: 0 auto;
		width: 750px;
	}
	:scope > div:first-child {
		height: 100vh;
		width: 100%;
	}
	</style>
	<script>
		var module = this;
		
		module.on("mount", function(){
			console.log("it app");
			opts.mountDfd.resolve();
		});
	</script>
</app>