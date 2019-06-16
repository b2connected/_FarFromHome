$("#sortable").sortable();
$("#sortable").disableSelection();

countTodos();

// 모두 확인 버튼
$("#checkAll").click(function(){
    AllDone();
});

// togolist생성 ( key event )
$('.add-todo').on('keypress',function (e) {
      e.preventDefault
      if (e.which == 13) {
           if($(this).val() != ''){
           var todo = $(this).val();
            createTodo(todo); 
            countTodos(); // togolist 수 증가
           }else{
               // some validation
           }
      }
});
// 완료한 list에 checked 
$('.todolist').on('change','#sortable li input[type="checkbox"]',function(){
    if($(this).prop('checked')){
        var doneItem = $(this).parent().parent().find('label').text();
        $(this).parent().parent().parent().addClass('remove');
        done(doneItem);
        countTodos();
    }
});

// 완료된 list 지우기
$('.todolist').on('click','.remove-item',function(){
    removeItem(this);
});

// lsit 세기
function countTodos(){
    var count = $("#sortable li").length;
    $('.count-todos').html(count);
}

//list 생성
function createTodo(text){
    var markup = '<li class="ui-state-default"><div class="checkbox"><label><input type="checkbox" value="" />'+ text +'</label></div></li>';
    $('#sortable').append(markup);
    $('.add-todo').val('');
}

// 끝난 표시하기
function done(doneItem){
    var done = doneItem;
    var markup = '<li>'+ done +'<button class="btn btn-default btn-xs pull-right  remove-item"><span class="glyphicon glyphicon-remove"></span></button></li>';
    $('#done-items').append(markup);
    $('.remove').remove();
}

// 전부 끝난 표시하기
function AllDone(){
    var myArray = [];

    $('#sortable li').each( function() {
         myArray.push($(this).text());   
    });
    
    // 끝난 애 추가
    for (i = 0; i < myArray.length; i++) {
        $('#done-items').append('<li>' + myArray[i] + '<button class="btn btn-default btn-xs pull-right  remove-item"><span class="glyphicon glyphicon-remove"></span></button></li>');
    }
    
    // myArray
    $('#sortable li').remove();
    countTodos();
}

// 완료된 list 지우기
function removeItem(element){
    $(element).parent().remove();
}