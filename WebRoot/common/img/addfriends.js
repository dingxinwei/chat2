// JavaScript Document
$(function (){
	$(".ba_leftf_block").click(function (){
			var ba_one = "<div class='ba_leftf_block'><div class='ba_lfb_face fl'><img src='";
			var ba_two = "'/></div><div class='ba_lfb_font fl'>";
			var ba_three = "</div><div class='ba_rfb_close fr'><img src='common/img/close.png'/></div></div>";
			var rts = $(".ba_right_top").html();
			$(this).addClass("ba_leftf_back");
			$(this).siblings(".ba_leftf_block").removeClass("ba_leftf_back");
			var bal = $(this).find(".ba_lfb_circle").find("img").attr("src");
			bal = bal.replace("common/img/","");
			bal = bal.replace(".png","");
			if(bal == "circle010"){
				$(this).find(".ba_lfb_circle").find("img").attr("src","common/img/circle011.png");
				var srcs = $(this).find(".ba_lfb_face").find("img").attr("src");
				var names = $(this).find(".ba_lfb_font").html();
				$(".ba_rif_box").children("div").append(ba_one + srcs + ba_two + names + ba_three);
				if(rts == "请勾选需要添加的联系人"){
					$(".ba_right_top").html("已选择了1个联系人");
					$(".ba_ri_but").addClass("ba_ri_buts");			
				}else{
					rts = rts.replace("已选择了","");
					rts = rts.replace("个联系人","");
					rts = parseInt(rts);
					rts++;
					$(".ba_right_top").html("已选择了" + rts + "个联系人"); 
				}
				friface();
				friscrs();		
			}else if(bal == "circle011"){
				$(this).find(".ba_lfb_circle").find("img").attr("src","common/img/circle010.png");
				if(rts.indexOf("已选择了") != -1 && rts != "已选择了1个联系人"){
					rts = rts.replace("已选择了","");
					rts = rts.replace("个联系人","");
					rts = parseInt(rts);
					rts--;
					$(".ba_right_top").html("已选择了" + rts + "个联系人"); 	
				}else if(rts == "已选择了1个联系人"){
					$(".ba_right_top").html("请勾选需要添加的联系人"); 
					$(".ba_ri_but").removeClass("ba_ri_buts");	
				}
				friscrs();			
			}	
		})
		
		$("body").on("click",".ba_rfb_close",function (){
			$(this).parents(".ba_leftf_block").remove();
			var rts = $(".ba_right_top").html();
			if(rts.indexOf("已选择了") != -1 && rts != "已选择了1个联系人"){
				rts = rts.replace("已选择了","");
				rts = rts.replace("个联系人","");
				rts = parseInt(rts);
				rts--;
				$(".ba_right_top").html("已选择了" + rts + "个联系人"); 	
			}else if(rts == "已选择了1个联系人"){
				$(".ba_right_top").html("请勾选需要添加的联系人"); 
				$(".ba_ri_but").removeClass("ba_ri_buts");		
			}
			friscrs();
			friscrs();	
		})		
})


	function addfris(){
		$(".yinyings").css("display","block");
		$(".buju_add").css("display","block");
		friscr();	
		friface();
	}
	
	function addclose(){
		$(".buju_add").css("display","none");	
		$(".ba_ri_but").removeClass("ba_ri_buts");
		$(".ba_leftf_box").find(".ba_leftf_block").removeClass("ba_leftf_back");
		$(".ba_leftf_box").find(".ba_lfb_circle").find("img").attr("src","common/img/circle010.png");
		$(".ba_rif_box").children("div").html("");
		$(".ba_right_top").html("请勾选需要添加的联系人");
		$(".yinyings").css("display","none");	
	}