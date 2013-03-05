//导航条的效果


function $(){return document.getElementById(arguments[0]);}


        //切换显示状态， 被点击的导航元素对应的div显示，并且隐藏该隐藏的div元素
function switchDisplay(id){
      console.log(id);
    var es=document.getElementsByTagName("div");
    console.log(es);
    var start=id.indexOf('-')+1
    //alert("start:"+start);
    var str= id.substr(start,id.length)+"_";
    console.log(str);
    for(var i=0;i<es.length;i++){
       var  itemIdVal=es.item(i).id;
      //  console.log(itemIdVal+","+str);
       // console.log("charAr;"+itemIdVal.charAt(itemIdVal.length-1));

        if(itemIdVal.charAt(itemIdVal.length-1)=="_") {

            if(itemIdVal==str){
                console.log("显示元素")
                openDiv(itemIdVal)  ;
            }else if(itemIdVal!=str){

                console.log("关闭元素的显示");
                closeDiv(itemIdVal);
            }
        }
    }

}



//打开div的显示
function openDiv(id){
    $(id).style.display="block";

}



//关闭div的显示
function closeDiv(id){
    $(id).style.display="none";

}


//----切换背景图片
function selectBg(val){
    console.log(val);
    var path="/resources/image/"  +"bg"+val+".jpg"
   document.body.style.background="url("+path+")";
    document.body.style.backgroundAttachment="fixed"  ;
  //  document.body.style.backgroundImage=path;
    //document.getElementsByName("body")[0].background.backgroundImage="/resources/image/bg8.jpg";
    console.log(document.body.background);
}





