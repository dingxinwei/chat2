
/**
 * ��װajax��ʹ��
 * @param method ����ʽ
 * @param url  ������Դ
 * @param data �������
 * @param asy false-->ͬ��  true-->�첽 
 * @param deal200 ����200�ĺ���
 * @param deal404 ����404�ĺ���
 * @param deal500 ����500�ĺ���
 * @param other ��Ӧ���δ��֮ǰҪ���Ĵ���
 */
function myAjax(method,url,data,asy,value,deal200,deal404,deal500,other){
			var ajax = getAjax();
			ajax.onreadystatechange=function(){
				if(4 == ajax.readyState){
					if(200 == ajax.status){
						if(deal200){
							deal200(ajax);
						}
					}else if(404 == ajax.status){
						if(deal404){
							deal404(ajax);
						}
					}else if(500 == ajax.status){
						if(deal500){
							deal500(ajax);
						}
					}
				}else{
					if(other){
						other();
					}
					
				}
			}
			if("get"==method){
				ajax.open(method,url+(data == null?"":"?"+data),asy);
				ajax.send(null);
			}else if("post" == method){
				ajax.open(method,url,asy);
				if(value != undefined){
					ajax.setRequestHeader("Content-Type",value);
				}
				
				ajax.send(data);
			}	
		}
//��ȡajax����
function getAjax(){
	var ajax;
	if(window.XMLHttpRequest){//���
		ajax = new XMLHttpRequest();
	}else if(window.ActiveXObject){//IE
		ajax = new ActiveObject("Msxml2.XMLHTTP");
	}
	return ajax;
}