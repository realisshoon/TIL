$(function() {
    const ctx = document.getElementById('myChart');
        //const DATA_COUNT = 5;
        //const NUMBER_CFG = {count: DATA_COUNT, min: 0, max: 100};
        //const labels = Utils.months({count: 8});

        new Chart(ctx, {
            type: 'pie',
            data: {
                //labels: ['기존 멤버', '신규 멤버', '기존 멤버, 기존 충성 고객', '기존 멤버, 복귀 고객', '신규 멤버, 신규 재구매 고객', '신규 멤버, 신규 첫구매 고객', '기존 멤버, 기존 안전 고객', '기존 멤버, 기존 재구매 고객'],
                datasets: [{
                    data: [2, 1, 3, 11, 6, 1],
                    backgroundColor: [
                    '#F5BFB2','#F8D3CB','#F2A492','#FBE5E0','#C4E2F7','#F2FAFE'
                    ],
                    labels: [
                    '기존 멤버, 복귀 고객','기존 멤버, 기존 충성 고객','기존 멤버, 기존 재구매 고객','기존 멤버, 기존 안정 고객','신규 멤버, 신규 재구매 고객','신규 멤버, 신규 첫구매 고객'
                    ],
                    borderWidth: 0   
                }, {
                    data: [17, 7],
                    backgroundColor: [
                    '#F0947E','#9DC6E4'
                    ],
                    labels: ['기존 멤버','신규 멤버'],
                    borderWidth: 0
                }
                    
                  /*{
                    backgroundColor: ['#AAA', '#777'],
                    data: [21, 79]
                  },
                  {
                    backgroundColor: ['hsl(0, 100%, 60%)', 'hsl(0, 100%, 35%)'],
                    data: [33, 67]
                  },*/
                  /*{
                    data: [2, 1, 3, 11, 6, 1],
                    backgroundColor: [
                    '#F5BFB2','#F8D3CB','#F2A492','#FBE5E0','#C4E2F7','#F2FAFE'
                    ],
                    borderWidth: 0,      
                    labels: [
                    '기존 멤버, 복귀 고객','기존 멤버, 기존 충성 고객','기존 멤버, 기존 재구매 고객','기존 멤버, 기존 안전 고객','신규 멤버, 신규 재구매 고객','신규 멤버, 신규 첫구매 고객'
                    ]          
                  },
                  {
                    data: [17, 7],
                    backgroundColor: [
                    '#F0947E','#9DC6E4'
                    ],
                    borderWidth: 0,
                    hoverOffset: 1,
                    labels: ['기존 멤버','신규 멤버'],
                  },*/
                ]
            },
            options:{ 
                plugins:{
                    legend: {
                        display: false
                    },
                    tooltip: {
                        /*callbacks: {
                            label: function(context) {
                                let label = context.dataset.label || '';
        
                                if (label) {
                                    label += ': ';
                                }
                                if (context.parsed.y !== null) {
                                    label += new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(context.parsed.y);
                                }
                                return label;
                            }
                        },*/
                        enabled: false
                    }
                }
            }
        });
});