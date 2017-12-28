<member style="padding: {opts.bgWidth.str}; background-image: url({opts.imgs.bg_star});">
	<div id="{opts.appId}">
		<img class="title" src="{opts.imgs.title_member}">
		<div class="info center colorize">
			参加者一覧です
		</div>
		<div class="container">
			<div each="{opts.memberList}">
				<a target="_blank" href="https://twitter.com/{id}">
					<div>
						<div>
							<img src="https://api.surume.tk/icon/twitter/{id}">
						</div>
						<div>
							<p><span class="colorize">{text}</span></p>
						</div>
					</div>
					<div>
						<span class="colorize">{name}</span><br><span class="colorize">(@{id})</span>
					</div>
				</a>
			</div>
		</div>
	</div>
	
	<style>
		:scope {
			color: #fff;
			font-weight: bold;
			text-shadow:0px 2px 0px #7d681d,0.8134732861516px 1.827090915285202px 0px #7d681d,1.486289650954788px 1.338261212717716px 0px #7d681d,1.902113032590307px 0.618033988749895px 0px #7d681d,1.989043790736547px -0.209056926535307px 0px #7d681d,1.732050807568877px -1px 0px #7d681d,1.175570504584946px -1.618033988749895px 0px #7d681d,0.415823381635519px -1.956295201467611px 0px #7d681d,-0.415823381635518px -1.956295201467611px 0px #7d681d,-1.175570504584946px -1.618033988749895px 0px #7d681d,-1.732050807568877px -1.000000000000001px 0px #7d681d,-1.989043790736547px -0.209056926535308px 0px #7d681d,-1.902113032590307px 0.618033988749894px 0px #7d681d,-1.486289650954788px 1.338261212717717px 0px #7d681d,-0.8134732861516px 1.827090915285202px 0px #7d681d;
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
			color: #fffbc4;
		}
		:scope>div .colorize span:nth-child(3n) {
			color: #ffe660;
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
			text-align: center;
		}
		:scope>div>*.container {
			display: flex;
			flex-wrap: wrap;
			justify-content: center;
			font-size: 1.2rem;
			line-height: 1;
			text-align: center;
		}
		:scope>div>*.container>* {
			box-sizing: border-box;
			width: 250px;
			padding: 0.7rem;
		}
		:scope>div>*.container a {
			text-decoration: none;
		}
		:scope>div>*.container a>div:nth-child(1) {
			display: flex;
			width: 100%;
			justify-content: space-between;
			align-items: center;
		}
		:scope>div>*.container a>div:nth-child(2) {
			text-align: left;
			padding-top: 0.2rem;
			padding-left: 1rem;
		}
		:scope>div>*.container a>div:nth-child(1)>div:nth-child(1) {
			width: 100px;
		}
		:scope>div>*.container a>div:nth-child(1)>div:nth-child(2) {
			width: 120px;
		}
		:scope>div>*.container a>div:nth-child(1)>div:nth-child(2)>p {
			border: solid 1px #aaa;
			border-radius: 5%;
			padding: 0.3rem;
			min-height: 2rem;
			line-height: 1.35;
			background-color: rgba(255,255,255, 0.8);
		}
		:scope>div>*.container img {
			border: solid 2px #bdbdbd;
			border-radius: 50%;
			width: 100px;
			height: 100px;
		}
	</style>
	
	<script>
		var module = this;
		var scrollMediator = opts.scrollMediator;
		
		module.on("before-mount", function(){
		});
		
		module.on("mount", function(){
			$('info .colorize, [data-is="member"] .colorize').children().addBack().contents().each(function(){
				if(this.nodeType !== Node.TEXT_NODE) return;
				
				var $this = $(this);
				$this.replaceWith($this.text().replace(/(\S)/g, "<span>$&</span>"));
			});
		});
		
		module.on("mount", function(){
			opts.dfd.resolve("member");
		});
	</script>
</member>