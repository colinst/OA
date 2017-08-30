function show() {
    /*$('#show').css('display','block');*/
    var a3 = document.getElementById("custom");
    a3.style.display = "inherit";
    var a1 = document.getElementById("model");
    a1.style.display = "none";
}
function hide() {
    var a1 = document.getElementById("custom");
    a1.style.display = "none";
    var a3 = document.getElementById("model");
    a3.style.display = "inherit";

}
function pageTest(obj) {

    window.location.href = "selectModel.do?currentPage=" + obj;
}

function add() {
    /*$('#show').css('display','block');*/
    var a3 = document.getElementById("content");
    a3.style.display = "inherit";
    var a1 = document.getElementById("add");
    a1.style.display = "none";
}
function use() {
    document.getElementById('use_table').submit();
}