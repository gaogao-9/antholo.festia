<contact>
	<div id="{opts.appId}">
		<p>contact!</p>
	</div>
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