 var db;
    var arrayKey=[];
    var request;
    var lstCursor;
    var content=document.querySelector("#content");
    var indexedDB=window.indexedDB||
            window.webkitIndexedDB||
                    window.mozIndexedDB||
                    window.msIndexdeDB;
    console.log(indexedDB);
    function init(){
//        console.log(document.querySelector("img"));

        openRequest=indexedDB.open("foo",2);
        openRequest.addEventListener("upgradeneeded",function(e){
            var thisDB= e.target.result;
//            console.log(thisDB);
            if(!thisDB.objectStoreNames.contains("member")){
                var objectStore=thisDB.createObjectStore("member",{keyPath:'id',autoIncrement:true});
                objectStore.createIndex('name',"name",{unique:false});
//                console.log(objectStore);
            }
        })
//        openRequest.addEventListener("success",function(){
//            console.log("数据库创建成功");
//        })
        openRequest.addEventListener("error",function(evt){
            console.log(evt+"数据库创建失败");
        });
