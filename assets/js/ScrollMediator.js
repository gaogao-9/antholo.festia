var ScrollMediator = (function(){
	var domDfd = (function(){
		var dfd = new jQuery.Deferred();
		jQuery(function($){
			dfd.resolve();
		});
		
		return dfd.promise();
	})();
	
	function ScrollMediator(){
		this.eleList = [];
		this.events  = {};
		this.currentScrollTop = -1;
		this.currentHeight    = -1;
		this.oldScrollTop     = -1;
		this.scrollTimerId    = null;
	};
	
	ScrollMediator.prototype.on = function on(name, callback){
		this.events[name] = this.events[name] || $.Callbacks("unique stopOnFalse");
		this.events[name].add(callback);
	};
	
	ScrollMediator.prototype.off = function off(name, callback){
		this.events[name] = this.events[name] || $.Callbacks("unique stopOnFalse");
		if(callback) this.events[name].remove(callback);
		else this.events[name].empty();
	};
	
	ScrollMediator.prototype.trigger = function trigger(name){
		if(!this.events[name]) return;
		
		this.events[name].fire.apply(this, Array.prototype.slice.call(arguments, 1));
	};
	
	ScrollMediator.prototype.updatePosition = function updatePosition(scrollTop){
		if(this.currentScrollTop === scrollTop) return;
		this.currentScrollTop = scrollTop;
		
		var eve = createEvent.call(this);
		this.trigger("position-change", eve);
		
		var currentIndex = updateEnterState.call(this);
	};
	
	ScrollMediator.prototype.updateSize = function updatePosition(height){
		if(this.currentHeight === height) return;
		this.currentHeight = height;
		
		var eve = createEvent.call(this);
		this.trigger("size-change", eve);
		
		updateItemHeight.call(this);
		var currentIndex = updateEnterState.call(this);
	};
	
	ScrollMediator.prototype.start = function start(list){
		var _this  = this;
		var $win = $(window);
		
		this.eleList = list.map(function(item){
			item.ele = $(item.ele);
			return $.extend({
				top: 0,
				bottom: 0,
				isEnter: false,
				isLeave: false,
				height: -1,
				enterOffset: -1,
			}, item);
		});
		
		// scrollイベントは変化が激しい時に間引く
		$win.on("scroll", function(eve){
			var scrollTop = $win.scrollTop();
			if(Math.abs(_this.oldScrollTop - scrollTop) > 30){ // 移動量間引きいらねーわこれｗ
				if(_this.scrollTimerId) return;
				
				_this.scrollTimerId = setTimeout(onScrollTimer.bind(_this, $win), 100);
			}
			else{
				_this.updatePosition(scrollTop);
			}
			_this.oldScrollTop = scrollTop;
		});
		
		$win.on("resize", function(eve){
			_this.updateSize($win.innerHeight());
		});
		
		this.currentScrollTop = $win.scrollTop();
		this.updateSize($win.innerHeight());
	};
	
	function createEvent(){
		return {
			scrollTop : this.currentScrollTop,
			windowHeight : this.currentHeight,
		};
	}
	
	function updateItemHeight(){
		var item, sum = 0;
		for(var i=0,iLen=this.eleList.length;i<iLen;i++){
			item = this.eleList[i];
			sum += item.height = item.ele.outerHeight();
			item.enterOffset = sum;
		}
	}
	
	function updateEnterState(){
		var item, item2, eve, offset, isVisibleChanged;
		for(var i=0,iLen=this.eleList.length;i<iLen;i++){
			item        = this.eleList[i];
			item.offset = item.ele.offset().top;
			visibleChanged = false;
			
			if((this.currentScrollTop+this.currentHeight > item.offset) ^ item.isEnter){
				item.isEnter = !item.isEnter;
				if(item.isEnter){
					eve = $.extend(createEvent.call(this), item);
					this.trigger(item.name+"-enter", eve);
				}
			}
			if((this.currentScrollTop >= item.enterOffset) ^ item.isLeave){
				item.isLeave = !item.isLeave;
				
				if(item.isLeave){
					eve = $.extend(createEvent.call(this), item);
					this.trigger(item.name+"-leave", eve);
				}
				eve = $.extend(createEvent.call(this), item);
				this.trigger(item.name+"-visible-change", eve);
			}
			if(item.isEnter && !item.isLeave){
				eve = $.extend(createEvent.call(this), item);
				this.trigger(item.name+"-visible", eve);
			}
		}
		
		return i;
	}
	
	function onScrollTimer($win){
		this.oldScrollTop  = $win.scrollTop();
		this.scrollTimerId = null;
		this.updatePosition(this.oldScrollTop);
	}
	return ScrollMediator;
})();





