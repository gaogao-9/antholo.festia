<join style="background-image: url({opts.imgs.bg_flower}); background-position-y: {this.flowerBgPos}%">
	<div id="{opts.appId}">
		<div class="oubo">
			<img class="title left" src="{opts.imgs.title_oubo}">
			<div>
				<img class="chara left" src="{opts.imgs.chara_isyu}">
				<ul style="background-image: url({opts.imgs.subhead00_blue})">
					<li>メールで連絡が取れる総理</li>
					<li>義務教育を終えている総理</li>
					<li>戦挙権を持っている総理</li>
				</ul>
			</div>
		</div>
		<div class="sanka">
			<img class="title right"  src="{opts.imgs.title_sankayotei}">
			<div>
				<ul style="background-image: url({opts.imgs.subhead01_purple})">
					<li>参加費完全無料</li>
					<li>書き下ろし原稿のみ寄稿可能</li>
					<li>成人向け作品はご遠慮ください</li>
					<li>頒布日時の3ヶ月後より、寄稿作品の個人公開自由</li>
				</ul>
				<img class="chara right" src="{opts.imgs.chara_maron}">
			</div>
		</div>
	</div>
	
	<style>
		:scope {
			width: 750px;
			padding-left: calc(50vw - 507px);
			padding-right: calc(50vw - 265px);
			font-family: "Rounded Mplus 1c";
			font-size: 1.7rem;
			background-size: cover;
			background-attachment: fixed;
			transition-property: background-position-y;
			transition-duration: 0.4s;
			transition-timing-function: ease;
		}
		
		:scope>div>div>* {
			position: relative;
		}
		
		:scope>div>div>img.title {
			width: 300px;
			margin-top: 15px;
			z-index: 100;
		}
		
		:scope>div>div>img.title.left {
			margin-left: 5px;
			transform: rotateZ(-5deg);
		}
		
		:scope>div>div>img.title.right {
			margin-left: 425px;
			transform: rotateZ(5deg);
		}
		
		:scope>div>div>div>img.chara.left {
			margin-left: 15px;
		}
		
		:scope>div>div>div>* {
			display: inline-block;
			vertical-align: middle;
		}
		
		:scope>div>div>div>img {
			width: 200px;
		}
		
		:scope>div>div>div>ul {
			box-sizing: border-box;
			margin: 10px 0 10px 10px;
			padding: 1.2rem 5rem 1.2rem 3.5rem;
			z-index: 10;
			line-height: 1.2;
			color: #fdfff6;
			background-size: cover;
			background-repeat: no-repeat;
			background-position-x: 101%;
			list-style-type: hiragana-iroha;
		}
		
		:scope>div>div.oubo>div>ul {
			width: 500px;
			padding: 1.2rem 5rem 1.2rem 3.5rem;
		}
		
		:scope>div>div.sanka>div>ul {
			width: 520px;
			padding: 3rem 1rem 1.6rem 3.5rem;
		}
	</style>
	
	<script>
		var module = this;
		var scrollMediator = opts.scrollMediator;
		
		module.on("before-mount", function(){
			module.flowerBgPos = 20;
		});
		
		scrollMediator.on("join-visible", function(eve){
			module.update({
				flowerBgPos: (eve.scrollTop - eve.offset + eve.windowHeight) / eve.enterOffset * -20 + 20,
			});
		});
		
		module.on("mount", function(){
			opts.dfd.resolve("join");
		});
	</script>
</join>