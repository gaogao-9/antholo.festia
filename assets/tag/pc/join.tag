<join style="padding: {opts.bgWidth.str}; background-image: url({opts.imgs.bg_flower});">
	<div id="{opts.appId}">
		<div class="oubo">
			<img class="title left" src="{opts.imgs.title_oubo}">
			<div>
				<ul>
					<li class="colorize">・メールで連絡が取れる総理</li>
					<li class="colorize">・義務教育を終えている総理</li>
					<li class="colorize">・戦挙権を持っている総理</li>
				</ul>
				<img class="chara right" src="{opts.imgs.chara_hirari}">
			</div>
		</div>
		<div class="sanka">
			<img class="title right" src="{opts.imgs.title_sankayotei}">
			<div>
				<img class="chara left" src="{opts.imgs.chara_syerobu}">
				<ul>
					<li class="colorize">・参加費完全無料</li>
					<li class="colorize">・書き下ろし原稿のみ寄稿可能</li>
					<li class="colorize">・成人向け作品はご遠慮ください</li>
					<li class="colorize">・頒布日時の3ヶ月後より、寄稿作品の個人公開自由</li>
				</ul>
			</div>
		</div>
		<div class="join">
			<a class="colorize" style="background-image:url({opts.imgs.subhead00_red});" target="_blank" href="https://docs.google.com/forms/d/e/1FAIpQLSdGTjLipLLwzJEOMo_-aKF04KtYigSwb3L00PYKX9cq0WEDkA/viewform">早速参加しよう！</a>
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
		
		:scope>div>div>img.title.left {
			margin-left: 5px;
			transform: rotateZ(-5deg);
		}
		
		:scope>div>div>img.title.right {
			margin-left: 425px;
			transform: rotateZ(5deg);
		}
		
		:scope>div>div>div{
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
		:scope>div>div>div>ul{
			margin: 0 1rem;
			max-width: 500px;
		}
		
		:scope>div>div>div img.chara {
			width: 200px;
			height: 100%;
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
			line-height: 1.8;
			padding: 2rem 0;
		}
		:scope>div .right {
			text-align: right;
		}
		:scope>div .center {
			text-align: center;
		}
		:scope>div>*.join {
			text-align: center;
			line-height: 1;
			padding-bottom: 5rem;
		}
		:scope>div>*.join>a {
			display: inline-block;
			width: 500px;
			height: 108px;
			box-sizing: border-box;
			padding: calc(54px - 1.25rem) 0;
			box-shadow: -5px 5px 6px rgba(224, 71, 71, 0.45);
			font-size: 2.5rem;
			text-align: center;
			text-decoration: none;
		}
	</style>
	
	<script>
		var module = this;
		var scrollMediator = opts.scrollMediator;
		
		module.on("mount", function(){
			$('info .colorize, [data-is="join"] .colorize').children().addBack().contents().each(function(){
				if(this.nodeType !== Node.TEXT_NODE) return;
				
				var $this = $(this);
				$this.replaceWith($this.text().replace(/(\S)/g, "<span>$&</span>"));
			});
		});
		
		module.on("mount", function(){
			opts.dfd.resolve("join");
		});
	</script>
</join>