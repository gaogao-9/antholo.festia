<contact style="padding: {opts.bgWidth.str}; background-image: url({opts.imgs.bg_star});">
	<div id="{opts.appId}">
		<img class="title" src="{opts.imgs.title_contact}">
		<div class="info center colorize">
			準備中！
		</div>
	</div>
	
	<style>
		:scope {
			color: #fff;
			font-weight: bold;
			text-shadow:0px 2px 0px #313bb5,0.8134732861516px 1.827090915285202px 0px #313bb5,1.486289650954788px 1.338261212717716px 0px #313bb5,1.902113032590307px 0.618033988749895px 0px #313bb5,1.989043790736547px -0.209056926535307px 0px #313bb5,1.732050807568877px -1px 0px #313bb5,1.175570504584946px -1.618033988749895px 0px #313bb5,0.415823381635519px -1.956295201467611px 0px #313bb5,-0.415823381635518px -1.956295201467611px 0px #313bb5,-1.175570504584946px -1.618033988749895px 0px #313bb5,-1.732050807568877px -1.000000000000001px 0px #313bb5,-1.989043790736547px -0.209056926535308px 0px #313bb5,-1.902113032590307px 0.618033988749894px 0px #313bb5,-1.486289650954788px 1.338261212717717px 0px #313bb5,-0.8134732861516px 1.827090915285202px 0px #313bb5;
			background-size: cover;
			background-attachment: fixed;
			background-color: #fefff9;
		}
		:scope>div>img.title {
			display: block;
			margin: 1rem auto;
		}
		:scope>div .colorize a {
			border-bottom: 2px solid #138a34;
			text-decoration: none;
		}
		:scope>div .colorize span:nth-child(3n+1) {
			color: #fff;
		}
		:scope>div .colorize span:nth-child(3n+2) {
			color: #c4f1ff;
		}
		:scope>div .colorize span:nth-child(3n) {
			color: #a6ddff;
		}
		:scope>div>* {
			line-height: 1.8;
			padding: 1rem 0;
		}
		:scope>div .right {
			text-align: right;
		}
		:scope>div .center {
			text-align: center;
		}
		:scope>div>*.info {
			font-size: 2rem;
			line-height: 1;
			text-align: center;
		}
	</style>
	
	<script>
		var module = this;
		var scrollMediator = opts.scrollMediator;
		
		module.on("before-mount", function(){
		});
		
		module.on("mount", function(){
			$('info .colorize, [data-is="contact"] .colorize').children().addBack().contents().each(function(){
				if(this.nodeType !== Node.TEXT_NODE) return;
				
				var $this = $(this);
				$this.replaceWith($this.text().replace(/(\S)/g, "<span>$&</span>"));
			});
		});
		
		module.on("mount", function(){
			opts.dfd.resolve("contact");
		});
	</script>
</contact>