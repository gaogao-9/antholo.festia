<links>
	<div id="{opts.appId}">
		<p>links!</p>
	</div>
	
	<style>
		:scoped {
			
		}
	</style>
	
	<script>
		var module = this;
		var scrollMediator = opts.scrollMediator;
		
		module.on("mount", function(){
			console.log("it links");
		});
		
		module.on("mount", function(){
			opts.dfd.resolve("links");
		});
	</script>
</links>