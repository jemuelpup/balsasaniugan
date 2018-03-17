$(document).ready(function(){
	var lastScrollTop = 0;
	$(window).scroll(function () {
		if($(window).width()<601){
			var st = $(this).scrollTop();
			if (st > lastScrollTop){
				console.log("down");
				$(".back.btn-floating").addClass("hideOnScrollTop");
			} else {
				console.log("up");
				$(".back.btn-floating.hideOnScrollTop").removeClass("hideOnScrollTop");
			}
			lastScrollTop = st;
		}
		else{
			$(".back.btn-floating.hideOnScrollTop").removeClass("hideOnScrollTop");
		}
	});
	$(".orderListContainer").css("padding-top",$(".spHeader").height()+"px");
	
});