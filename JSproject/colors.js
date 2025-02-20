function nightDayHandler(self){
    var Link ={
        setColor:function(color){
            var alist=document.querySelectorAll('a');
            var i=0;
            while(i<alist.length){
                alist[i].style.color=color;
                i+=1;
            }
        }
    }
    var Body={
        setColor:function(color){
            document.querySelector('body').style.color=color;
        },
        setBackgroundColor:function(color){
            document.querySelector('body').style.backgroundColor=color;
        }
    }
    var target=document.querySelector('body');
    if(self.value==='night'){
        // target.style.backgroundColor='black';
        Body.setBackgroundColor('black');

        // target.style.color='white'
        Body.setColor('white');
        self.value='day';
        Link.setColor('powderblue');


    } else{
        // target.style.backgroundColor='white';
        Body.setBackgroundColor('white');

        // target.style.color='black';
        Body.setColor('black');
        self.value='night';
        Link.setColor('blue');
    }
}