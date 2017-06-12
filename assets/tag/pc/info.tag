<info style="background-image: url({opts.imgs.bg_star});">
	<div id="{opts.appId}">
		<img class="title" src="{opts.imgs.title_site}">
		<div class="info center colorize">
			当サイトは、2017年冬のコミックマーケット93で
			頒布予定の「政マニオールキャラアンソロジー」の
			企画の告知ページです。
		</div>
		<div class="data">
			<table>
				<tr><td class="right colorize">タイトル：</td><td class="colorize">未定</td></tr>
				<tr><td class="right colorize">対象：</td><td class="colorize">全年齢向け</td></tr>
				<tr><td class="right colorize">発行日：</td><td class="colorize">2017年12月 コミックマーケット93 政マニ配置該当日</td></tr>
				<tr><td class="right colorize">印刷形式：</td><td class="colorize">A5サイズ／本文モノクロ／オフセット</td></tr>
				<tr><td class="right colorize">印刷所：</td><td class="colorize">緑陽社さまを予定</td></tr>
				<tr><td class="right colorize">通販予定：</td><td class="colorize">有</td></tr>
			</table>
		</div>
		<div class="member">
			<ul class="right">
				<li class="colorize">【主催】</li>
				<li class="colorize">伊丹（twitter ID: <a href="https://twitter.com/sanetaso" target="_blank">@sanetaso</a>）</li>
				<li class="colorize">のんアフ（twitter ID: <a href="https://twitter.com/non_affleck" target="_blank">@non_affleck</a>）</li>
				<li class="colorize">がお（twitter ID: <a href="https://twitter.com/gaogao_9" target="_blank">@gaogao_9</a>）</li>
			</ul>
		</div>
		<div class="notification center colorize">
			※このアンソロジーはフィクションです。<br>
			実在の人物、団体とは関係ありません。<br>
			また、政剣マニフェスティア公式各位とも関係ありません。<br>
			ホントに一切関係がありません。<br>
			<br>
			ただの総理が思いの丈をぶつけるアンソロジーです。
		</div>
	</div>
	
	<style>
		:scope {
			color: #fff;
			font-weight: bold;
			text-shadow:0px 2px 0px #138a34,0.8134732861516px 1.827090915285202px 0px #138a34,1.486289650954788px 1.338261212717716px 0px #138a34,1.902113032590307px 0.618033988749895px 0px #138a34,1.989043790736547px -0.209056926535307px 0px #138a34,1.732050807568877px -1px 0px #138a34,1.175570504584946px -1.618033988749895px 0px #138a34,0.415823381635519px -1.956295201467611px 0px #138a34,-0.415823381635518px -1.956295201467611px 0px #138a34,-1.175570504584946px -1.618033988749895px 0px #138a34,-1.732050807568877px -1.000000000000001px 0px #138a34,-1.989043790736547px -0.209056926535308px 0px #138a34,-1.902113032590307px 0.618033988749894px 0px #138a34,-1.486289650954788px 1.338261212717717px 0px #138a34,-0.8134732861516px 1.827090915285202px 0px #138a34;
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
			color: #e9ffb7;
		}
		:scope>div .colorize span:nth-child(3n) {
			color: #baff71;
		}
		:scope>div>* {
			line-height: 1.8;
			padding: 2rem 0;
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
		:scope>div>*.data {
			font-size: 1.2rem;
		}
		:scope>div>*.member {
			font-size: 1.2rem;
		}
		:scope>div>*.notification {
			font-size: 1.7rem;
			padding-bottom: 4rem;
		}
	</style>
	
	<script>
		var module = this;
		var scrollMediator = opts.scrollMediator;
		
		module.on("mount", function(){
			$('info .colorize, [data-is="info"] .colorize').children().addBack().contents().each(function(){
				if(this.nodeType !== Node.TEXT_NODE) return;
				
				var $this = $(this);
				$this.replaceWith($this.text().replace(/(\S)/g, "<span>$&</span>"));
			});
		});
		
		module.on("mount", function(){
			opts.dfd.resolve("info");
		});
	</script>
</info>