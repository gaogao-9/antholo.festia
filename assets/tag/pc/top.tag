<top style="background-image:url({this.opts.imgs.top_bg});">
	<div class="title">
		<h1><span>政剣マニフェスティア</span><br><span>オールキャラアンソロジー</span></h1>
	</div>
	<div class="media">
		<div class="twitter"><a class="twitter-timeline" data-lang="ja" href="https://twitter.com/antholo_seimani">Tweets by antholo_seimani</a></div>
		<div class="info">
			<h2>お知らせ</h2>
			<div>
				<article>[17/03/11] ダミーデータ1</article>
				<article>[17/03/10] ダミーデータ2</article>
				<article>[17/03/10] ダミーデータ3</article>
				<article>[17/03/10] ダミーデータ4</article>
				<article>[17/03/10] ダミーデータ5</article>
				<article>[17/03/10] ダミーデータ6</article>
				<article>[17/03/10] ダミーデータ7</article>
				<article>[17/03/10] ダミーデータ8</article>
			</div>
		</div>
	</div>
	<div class="menu">
		<div>
			<a each="{item in opts.menu}" href="#{item.name}">{item.title}</a>
		</div>
	</div>
	
	<style>
		:scope {
			background-size: contain;
			background-attachment: fixed;
			background-repeat: no-repeat;
			background-position: right bottom;
			line-height: 1;
		}
		
		:scope>.title {
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			transform: translateX(-50vw) rotateZ(-20deg) translateX(9.5rem) translateY(6rem);
		}
		
		:scope>.title>h1 {
			color: white;
			background-color: rgba(0, 105, 255, 0.7);
			text-align: center;
			padding: 0.5rem 0;
			font-size: 1.5rem;
			line-height: 1.3;
		}
		
		:scope>.menu {
			background-color: #aa7c49;
		}
		
		:scope>.menu>div>a {
			text-decoration: none;
		}
		
		:scope>.menu>div, :scope>.media {
			display: flex;
			width: 1000px;
			margin: 0 auto 1rem;
		}
		
		:scope>.media {
			height: calc(100vh - 4rem);
		}
		
		:scope>.media>.twitter {
			overflow: scroll;
			margin: auto 0 0;
			width: 460px;
			height: 100%;
			max-height: 60vh;
			border: solid 1px rgba(128, 128, 128, 0.4);
		}
		
		:scope>.menu>div>a {
			display: inline-block;
			width: 100%;
			padding: 1rem 0;
			
			color: white;
			text-align: center;
		}
		
		:scope>.media>.info {
			box-sizing: border-box;
			margin: auto 1rem 0;
			width: calc(1000px - 460px - 2rem);
			height: 35vh;
			max-height: 14rem;
			border: solid 1px rgba(8, 162, 111, 0.87);
			line-height: 1;
		}
		
		:scope>.media>.info>h2 {
			padding: 0.4rem 0;
			text-align: center;
			color: white;
			background-color: rgba(8, 162, 111, 0.87);
			font-size: 1.2rem;
		}
		
		:scope>.media>.info>div {
			height: calc(100% - 2rem);
			overflow-x: hidden;
			overflow-y: scroll;
			background-color: rgba(255, 255, 255, 0.4);
		}
		
		:scope>.media>.info>div>article {
			padding: 0.2rem 0.1rem;
		}
		
		:scope>.media>.info>div>article:not(:first-child) {
			border-top: dotted 2px #aaa;
		}
	</style>
	
	<script>
		var module = this;
		var scrollMediator = opts.scrollMediator;
		
		module.on("mount", function(){
			$("head").append('<'+'script async src="//platform.twitter.com/widgets.js" charset="utf-8"><'+'/script>');
		});
		
		module.on("mount", function(){
			opts.dfd.resolve("top");
		});
		
	</script>
</top>