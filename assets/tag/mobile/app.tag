<app style="background-image: url({opts.imgs.bg_top});">
	<div>
		<h1>政剣マニフェスティア<br>オールキャラアンソロジー</h1>
		
		<div>
			<h1><img src="{opts.imgs.title_site}"></h1>
			
			<p>
				当サイトは、2017年冬のコミックマーケット93で<br>
				頒布予定の「政マニオールキャラアンソロジー」の<br>
				企画の告知ページです。
			</p>
			
			<table class="center">
				<tr><td class="right">タイトル：</td><td class="left">総理たちの 総理たちによる 総理たちのための 政マニアンソロジー</td></tr>
				<tr><td class="right">対象：</td><td class="left">全年齢向け</td></tr>
				<tr><td class="right">発行日：</td><td class="left">2017年12月29日 コミックマーケット93 東5ポ07ab</td></tr>
				<tr><td class="right">印刷形式：</td><td class="left">A5サイズ／本文モノクロ／オフセット</td></tr>
				<tr><td class="right">印刷所：</td><td class="left">緑陽社さまを予定</td></tr>
				<tr><td class="right">通販予定：</td><td class="left">有</td></tr>
			</table>
			
			<ul class="center">
				<li class="center">【主催】</li>
				<li class="left">伊丹（twitter ID: <a href="https://twitter.com/sanetaso" target="_blank">@sanetaso</a>）</li>
				<li class="left">のんアフ（twitter ID: <a href="https://twitter.com/non_affleck" target="_blank">@non_affleck</a>）</li>
				<li class="left">がお（twitter ID: <a href="https://twitter.com/gaogao_9" target="_blank">@gaogao_9</a>）</li>
			</ul>
			
			<p>
				※このアンソロジーはフィクションです。<br>
				実在の人物、団体とは関係ありません。<br>
				また、政剣マニフェスティア公式各位とも関係ありません。<br>
				ホントに一切関係がありません。<br>
				<br>
				ただの総理が思いの丈をぶつけるアンソロジーです。
			</p>
		</div>
		
		<div>
			<h1><img src="{opts.imgs.title_oubo}"></h1>
			
			<ul class="center">
				<li class="left">・メールで連絡が取れる総理</li>
				<li class="left">・義務教育を終えている総理</li>
				<li class="left">・戦挙権を持っている総理</li>
			</ul>
		</div>
		
		<div>
			<h1><img src="{opts.imgs.title_sankayotei}"></h1>
			
			<ul class="center">
				<li class="left">・参加費完全無料</li>
				<li class="left">・書き下ろし原稿のみ寄稿可能</li>
				<li class="left">・成人向け作品はご遠慮ください</li>
				<li class="left">・頒布日時の3ヶ月後より、寄稿作品の個人公開自由</li>
			</ul>
			
			<p class="join">
				<a style="background-image:url({opts.imgs.subhead00_red});" target="_blank" href="https://docs.google.com/forms/d/e/1FAIpQLSdGTjLipLLwzJEOMo_-aKF04KtYigSwb3L00PYKX9cq0WEDkA/viewform">早速参加しよう！</a>
			</p>
		</div>
		
		<div>
			<h1><img src="{opts.imgs.title_member}"></h1>
			
			<div class="container">
				<div class="memberCard" each="{opts.memberList}">
					<a target="_blank" href="https://twitter.com/{id}">
						<img src="http://furyu.nazo.cc/twicon/{id}/original"><br>
						<span>{name}</span><br><span>(@{id})</span>
					</a>
				</div>
			</div>
			
			<p class="center">
				他のメンバーは近日公開予定！
			</p>
		</div>
		
		<div>
			<h1><img src="{opts.imgs.title_flyer}"></h1>
			
			<div class="paper center">
				<img src="{opts.imgs.res_flyer}">
			</div>
			<p>
				フライヤー完成しました！
			</p>
		</div>
		
		<div>
			<h1><img src="{opts.imgs.title_market}"></h1>
			
			<p>
				準備中
			</p>
		</div>
		
		<div>
			<h1><img src="{opts.imgs.title_links}"></h1>
			
			<div class="links">
				<ul>
					<li>・<a target="_blank" href="http://www.ryokuyou.co.jp/doujin/manual/basic.html">原稿作成の基本 | 同人誌印刷の緑陽社</a></li>
					<li>・<a target="_blank" href="http://www.ryokuyou.co.jp/doujin/column/atumono.html">分厚い本をキレイに作るコツ  | 同人誌印刷の緑陽社</a></li>
					<li>・<a target="_blank" href="http://www.shimaya.net/hajimete-no-doujinshi/index.html">同人誌初心者のための しまねぇ＆まやちゃん はじめての同人誌</a></li>
				</ul>
			</div>
		</div>
		
		<div>
			<h1><img src="{opts.imgs.title_contact}"></h1>
			
			<p>
				準備中
			</p>
		</div>
	</div>
	
	<style>
		:scope {
			display: block;
			text-align: center;
			word-wrap: break-word;
			overflow-wrap: break-word;
			background-size: contain;
			background-attachment: fixed;
			background-color: #fefff9;
			background-position: right bottom;
			background-repeat: no-repeat;
		}
		:scope>div {
			background-color: rgba(255, 255, 255, 0.7);
		}
		:scope>div>h1 {
			padding-top: 5rem;
			font-size: 3rem;
		}
		:scope>div>div {
			margin: 5rem 0;
			width: 100%;
			font-size: 1.5rem;
			line-height: 1.75;
		}
		:scope>div>div:last-of-type {
			padding-bottom: 5rem;
			margin: 0rem;
		}
		:scope>div>div>* {
			margin: 3rem 0;
		}
		:scope>div>div>table td:first-of-type {
			min-width: 8rem;
		}
		:scope>div>div>ul {
			display: table;
		}
		:scope>div>div .left {
			margin-left: 0;
			margin-right: auto;
			text-align: left;
		}
		:scope>div>div .right {
			margin-left: auto;
			margin-right: 0;
			text-align: right;
		}
		:scope>div>div .center {
			margin-left: auto;
			margin-right: auto;
			text-align: center;
		}
		:scope>div>div>*.join {
			text-align: center;
			line-height: 1;
		}
		:scope>div>div>*.join>a {
			color: white;
			display: inline-block;
			width: 500px;
			max-width: 100%;
			height: 108px;
			box-sizing: border-box;
			padding: calc(54px - 1.25rem) 0;
			box-shadow: -5px 5px 6px rgba(224, 71, 71, 0.45);
			font-size: 2.5rem;
			text-align: center;
			text-decoration: none;
		}
		:scope>div>div>*.container {
			display: flex;
			flex-wrap: wrap;
			justify-content: center;
			font-size: 1.4rem;
			line-height: 1;
			text-align: center;
		}
		:scope>div>div>*.container a {
			text-decoration: none;
		}
		:scope>div>div>*.container>.memberCard{
			width: 300px;
		}
		:scope>div>div>*.container img {
			border: solid 2px #bdbdbd;
			border-radius: 50%;
			width: 170px;
			max-width: 100%;
			height: 170px;
		}
		:scope>div>div>*.paper img {
			width: 100%;
		}
		:scope>div>div>*.links>ul {
			display: inline-block;
			text-align: left;
			line-height: 1.7;
		}
	</style>
	<script>
		var module = this;
		
		module.on("mount", function(){
			console.log("it app", opts.imgs);
		});
	</script>
</app>