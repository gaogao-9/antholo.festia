<member style="padding: {opts.bgWidth.str}; background-image: url({opts.imgs.bg_star});">
	<div id="{opts.appId}">
		<img class="title" src="{opts.imgs.title_member}">
		<div class="info center colorize">
			参加者一覧です
		</div>
		<div class="container">
			<div each="{memberList}">
				<a target="_blank" href="https://twitter.com/{id}">
					<img src="{img}"><br>
					<span class="colorize">{name}</span> <span class="colorize">(@{id})</span>
				</a>
			</div>
		</div>
		<div class="center colorize">
			他のメンバーは近日公開予定！
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
			justify-content: center;
			font-size: 1.4rem;
			line-height: 1;
			text-align: center;
		}
		:scope>div>*.container>* {
			padding: 0.7rem;
		}
		:scope>div>*.container a {
			text-decoration: none;
		}
		:scope>div>*.container img {
			border: solid 2px #bdbdbd;
			border-radius: 50%;
			width: 170px;
			height: 170px;
		}
	</style>
	
	<script>
		var module = this;
		var scrollMediator = opts.scrollMediator;
		
		module.on("before-mount", function(){
			module.memberList = [
				{ id: "sanetaso", name: "伊丹", img: "https://pbs.twimg.com/profile_images/886922275068366848/0cRGWrdp_400x400.jpg"},
				{ id: "non_affleck", name: "のんアフ", img: "https://pbs.twimg.com/profile_images/860445188577050625/KYJnWgnU_400x400.jpg"},
				{ id: "gaogao_9", name: "がお", img: "https://pbs.twimg.com/profile_images/823149296384020482/rALItQkG_400x400.jpg"},
			];
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