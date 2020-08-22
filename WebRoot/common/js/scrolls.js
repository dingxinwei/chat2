// JavaScript Document
//中间滚动条
function scrolls(){
	var boxs = $(".bcen_box").height();
	var juli = $(".bcen_jilu").height();
	if(juli > boxs){
		//屏幕高度÷记录高度
		var boxs_bi = boxs/juli;
		//滚动条高度
		var scrolls = boxs_bi*boxs;
		scrolls = Math.trunc(scrolls); 
		$(".bcen_scroll").height(scrolls);
	}else{
		$(".bcen_scroll").css("display","none");	
	}
}
$(function (){
	$(".bcen_box").mouseenter(function (){
		var boxs = $(".bcen_box").height();
		var juli = $(".bcen_jilu").height();
		if(juli > boxs){
			$(".bcen_scroll").css("display","block");
		}
	})
	
	$(".bcen_box").mouseleave(function (){
		$(".bcen_scroll").css("display","none");
	})
	
	$(".bcen_box").scroll(function (){
		var boxs = $(".bcen_box").height();
		$(".bcen_scroll").css("display","block");
		//滚动条高度
		var tiao = $(".bcen_scroll").height();
		if(tiao > 0){
			//滚动条实际滚动距离
			var scrs = $(this).scrollTop();
			var tops = scrs + 62;
			var gao = boxs - tiao + 62;
			if(tops > gao){
				tops = gao;	
			}
			$(".bcen_scroll").css("top",tops + "px");
		}
	})
})

//首页对话滚动条
function chatscr(){
	var bboxs = $(".brce_block_box").height();
	var bjl = $(".brce_block_box").children("div").height();
	if(bjl > bboxs){
		//屏幕高度÷记录高度
		var bboxs_bi = bboxs/bjl;
		//滚动条高度
		var scrs = bboxs_bi*bboxs;
		scrs = Math.trunc(scrs); 
		$(".bri_center_scroll").height(scrs);
	}else{
		$(".bri_center_scroll").css("display","none");	
	}
}
$(function (){
	$(".brce_block_box").mouseenter(function (){
		var bboxs = $(".brce_block_box").height();
		var bjl = 0; //$("#acc").val() == null ?0:document.getElementById($("#acc").val()).style.height;
		if(bjl > bboxs){
			$(".bri_center_scroll").css("display","block");
		}
	})
	
	$(".brce_block_box").mouseleave(function (){
		$(".bri_center_scroll").css("display","none");
	})
	
	$(".brce_block_box").scroll(function (){
		var bboxs = $(".brce_block_box").height();
		$(".bri_center_scroll").css("display","block");
		//滚动条高度
		var tiao = $(".bri_center_scroll").height();
		if(tiao > 0){
			//滚动条实际滚动距离
			var scrs = $(this).scrollTop();
			var tops = scrs;
			var gao = bboxs - tiao;
			if(tops > gao){
				tops = gao;	
			}
			$(".bri_center_scroll").css("top",tops + "px");
		}
	})
})
//添加朋友左滚动条
function friscr(){
	/*var boxs = 430;*/
	var ble = $(".ba_leftf_box").children("div").height();
	if(ble > 430){
		//屏幕高度÷记录高度
		var ble_bi = 430/ble;
		//滚动条高度
		var scs = ble_bi*430;
		scs = Math.trunc(scs); 
		$(".ba_leftf_scroll").height(scs);
	}else{
		$(".ba_leftf_scroll").css("display","none");	
	}
}
$(function (){
	$(".ba_leftf_box").mouseenter(function (){
		var ble = $(".ba_leftf_box").children("div").height();
		if(ble > 430){
			$(".ba_leftf_scroll").css("display","block");
		}
	})
	
	$(".ba_leftf_box").mouseleave(function (){
		$(".ba_leftf_scroll").css("display","none");
	})
	
	$(".ba_leftf_box").scroll(function (){
		$(".ba_leftf_scroll").css("display","block");
		//滚动条高度
		var gdt = $(".ba_leftf_scroll").height();
		if(gdt > 0){
			//滚动条实际滚动距离
			var scrs = $(this).scrollTop();
			var tops = scrs;
			var gao = 430 - gdt;
			if(tops > gao){
				tops = gao;	
			}
			$(".ba_leftf_scroll").css("top",tops + "px");
		}
	})
})
//添加朋友右滚动条
function friscrs(){
	/*var boxs = 380;*/
	var bre = $(".ba_rif_box").children("div").height();
	if(bre > 380){
		//屏幕高度÷记录高度
		var bre_bi = 380/bre;
		//滚动条高度
		var scss = bre_bi*380;
		scss = Math.trunc(scss); 
		$(".ba_rif_scroll").height(scss);
	}else{
		$(".ba_rif_scroll").css("display","none");	
	}
}
$(function (){
	$(".ba_rif_box").mouseenter(function (){
		var bre = $(".ba_rif_box").children("div").height();
		if(bre > 380){
			$(".ba_rif_scroll").css("display","block");
		}
	})
	
	$(".ba_rif_box").mouseleave(function (){
		$(".ba_rif_scroll").css("display","none");
	})
	
	$(".ba_rif_box").scroll(function (){
		$(".ba_rif_scroll").css("display","block");
		//滚动条高度
		var gdt = $(".ba_rif_scroll").height();
		if(gdt > 0){
			//滚动条实际滚动距离
			var scrs = $(this).scrollTop();
			var tops = scrs;
			var gao = 380 - gdt;
			if(tops > gao){
				tops = gao;	
			}
			$(".ba_rif_scroll").css("top",tops + "px");
		}
	})
})