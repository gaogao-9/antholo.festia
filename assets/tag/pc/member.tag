<member>
	<p>member!</p>
	
	<style>
		:scoped {
			
		}
	</style>
	
	<script>
		var module = this;
		
		module.on("mount", function(){
			console.log("it member");
		});
	</script>
</member>