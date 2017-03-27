<join>
	<div id="{opts.appId}">
		<p>join!</p>
	</div>
	
	<style>
		:scoped {
			
		}
	</style>
	
	<script>
		var module = this;
		var scrollMediator = opts.scrollMediator;
		
		module.on("mount", function(){
			console.log("it join");
		});
		
		module.on("mount", function(){
			opts.dfd.resolve("join");
		});
	</script>
</join>