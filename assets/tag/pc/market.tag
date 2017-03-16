<market>
	<p>market!</p>
	
	<style>
		:scoped {
			
		}
	</style>
	
	<script>
		var module = this;
		var scrollMediator = opts.scrollMediator;
		
		module.on("mount", function(){
			console.log("it market");
		});
		
		module.on("mount", function(){
			opts.dfd.resolve("market");
		});
	</script>
</market>