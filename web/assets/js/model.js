function show() {
    /*$('#show').css('display','block');*/
    var a3 = document.getElementById("context2");
    a3.style.display = "inherit";
    var a1 = document.getElementById("model");
    a1.style.display = "none";
    var a4 = document.getElementById("context2")
    a4.style.display = "inherit";
}
function hide() {
    var a1 = document.getElementById("context2");
    a1.style.display = "none";
    var a3 = document.getElementById("model");
    a3.style.display = "inherit";
    $("#context2").hide()

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
function stat() {
    document.getElementById('sys_stat').submit();


}
function write_submit() {
    var flag = true;
    var x = document.getElementsByName("list[0].columnName");
    for (var i = 0; i < x.length; i++) {
        if (x[i].value == "") {
            alert("还有未填写的内容不能提交！")
            flag = false;
            return false;// 有空值
        }

    }
    if (flag) {
        document.getElementById('writeinstat').submit();
    }
}

var isCheckAll = false;
function swapCheck() {
    if (isCheckAll) {
        $("input[type='checkbox']").each(function () {
            this.checked = false;
        });
        isCheckAll = false;
    } else {
        $("input[type='checkbox']").each(function () {
            this.checked = true;
        });
        isCheckAll = true;
    }
}


