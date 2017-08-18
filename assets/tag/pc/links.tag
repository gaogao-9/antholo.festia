<links style="padding: {opts.bgWidth.str}; background-image: url({opts.imgs.bg_flower});">
	<div id="{opts.appId}">
		<img class="title" src="{opts.imgs.title_links}">
		<div class="info center">
			<ul>
				<li class="colorize">・<a target="_blank" href="http://www.ryokuyou.co.jp/doujin/manual/basic.html">原稿作成の基本 | 同人誌印刷の緑陽社</a></li>
				<li class="colorize">・<a target="_blank" href="http://www.ryokuyou.co.jp/doujin/column/atumono.html">分厚い本をキレイに作るコツ  | 同人誌印刷の緑陽社</a></li>
				<li class="colorize">・<a target="_blank" href="http://www.shimaya.net/hajimete-no-doujinshi/index.html">同人誌初心者のための しまねぇ＆まやちゃん はじめての同人誌</a></li>
			</ul>
		</div>
	</div>
	
	<style>
		:scope {
			color: #fff;
			font-weight: bold;
			text-shadow:0px 2px 0px #8a1313,0.8134732861516px 1.827090915285202px 0px #8a1313,1.486289650954788px 1.338261212717716px 0px #8a1313,1.902113032590307px 0.618033988749895px 0px #8a1313,1.989043790736547px -0.209056926535307px 0px #8a1313,1.732050807568877px -1px 0px #8a1313,1.175570504584946px -1.618033988749895px 0px #8a1313,0.415823381635519px -1.956295201467611px 0px #8a1313,-0.415823381635518px -1.956295201467611px 0px #8a1313,-1.175570504584946px -1.618033988749895px 0px #8a1313,-1.732050807568877px -1.000000000000001px 0px #8a1313,-1.989043790736547px -0.209056926535308px 0px #8a1313,-1.902113032590307px 0.618033988749894px 0px #8a1313,-1.486289650954788px 1.338261212717717px 0px #8a1313,-0.8134732861516px 1.827090915285202px 0px #8a1313;
			background-size: cover;
			background-attachment: fixed;
			background-color: #fefff9;
		}
		:scope>div>img.title {
			display: block;
			margin: 1rem auto;
		}
		:scope>div .colorize a {
			border-bottom: 2px solid #8a1313;
			text-decoration: none;
		}
		:scope>div .colorize span:nth-child(3n+1) {
			color: #fff;
		}
		:scope>div .colorize span:nth-child(3n+2) {
			color: #ffc8c8;
		}
		:scope>div .colorize span:nth-child(3n) {
			color: #fda8a8;
		}
		:scope>div>* {
			padding: 1rem 0;
			line-height: 1.8;
		}
		:scope>div .right {
			text-align: right;
		}
		:scope>div .center {
			text-align: center;
		}
		:scope>div>*.info {
			padding-bottom: 2rem;
			font-size: 1.5rem;
			line-height: 2;
			text-align: left;
		}
	</style>
	
	<script>
		var module = this;
		var scrollMediator = opts.scrollMediator;
		
		module.on("before-mount", function(){
		});
		
		module.on("mount", function(){
			$('info .colorize, [data-is="links"] .colorize').children().addBack().contents().each(function(){
				if(this.nodeType !== Node.TEXT_NODE) return;
				
				var $this = $(this);
				$this.replaceWith($this.text().replace(/(\S)/g, "<span>$&</span>"));
			});
		});
		
		module.on("mount", function(){
			opts.dfd.resolve("links");
		});
	</script>
</links>