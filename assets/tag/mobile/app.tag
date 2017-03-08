<app>
	<p>app!</p>
	<virtual each="{value,key in opts.menu}">
		<div data-is="{value.name}"></div>
	</virtual>
	
	<style>
		>p {
			color: red;
		}
	</style>
	<script>
		var module = this;
		
		module.on("mount", function(){
			console.log("it app");
		});
	</script>
</app>