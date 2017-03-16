<contact>
	<p>contact!</p>
	
	<style>
		:scoped {
			
		}
	</style>
	
	<script>
		var module = this;
		var scrollMediator = opts.scrollMediator;
		
		module.on("mount", function(){
			console.log("it contact");
		});
		
		module.on("mount", function(){
			opts.dfd.resolve("contact");
		});
	</script>
</contact>