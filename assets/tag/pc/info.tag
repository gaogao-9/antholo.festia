<info>
	<p>info!</p>
	
	<style>
		:scoped {
			
		}
	</style>
	
	<script>
		var module = this;
		var scrollMediator = opts.scrollMediator;
		
		module.on("mount", function(){
			console.log("it info");
		});
		
		module.on("mount", function(){
			opts.dfd.resolve("info");
		});
	</script>
</info>