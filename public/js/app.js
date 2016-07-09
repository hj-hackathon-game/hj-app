$(document).ready(function () {
    var app = new Vue({
        el: '#app',
        data: {
            chatHistory: [],
            problem_id: -1,
            time: new Date().getTime()/1000
        },
        methods: {
            choose: function(choice){
                this.chatHistory.push({
                    role: 'User',
                    text: String.fromCharCode(choice + 65)
                });
                $.ajax({
                    type: "POST",
                    url: "/problem/answer",
                    data: JSON.stringify({id: app.problem_id, ans: choice, time: new Date().getTime()/1000 - app.time}),
                    success: function(data){
                        alert(data.result);
                        app.newProblem();
                    }
                })
            },
            newProblem: function(){
                $.ajax({
                    type: "GET",
                    url: "/problem/new",
                    success: function(data){
                        app.chatHistory.push({role: 'Tutor', text: data.description});
                        app.problem_id = data['id'];
                        app.time = new Date().getTime()/1000;
                    }
                })

                $.ajax({
                    type: "GET",
                    url: "/problem/predict",
                    success: function(data){
                        var test = data;
                        for (var j = 1; j < 20; j+=2){
                            test[j] /= 60;
                            if (test[j] > 1){
                                test[j] = 1;
                            }
                        }
                        var result = standalone(test);
                        var option = {
                            title: {
                                text: '用户隐型情况判断',
                                subtext: '数据来自神经网络预测'
                            },
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {
                                    type: 'shadow'
                                }
                            },
                            grid: {
                                left: '3%',
                                right: '4%',
                                bottom: '3%',
                                containLabel: true
                            },
                            xAxis: {
                                type: 'value',
                                boundaryGap: [0, 0.01]
                            },
                            yAxis: {
                                type: 'category',
                                data: ['词汇量不足','语法知识弱','阅读速度慢']
                            },
                            series: [
                                {
                                    name: '概率',
                                    type: 'bar',
                                    data: result
                                }

                            ]
                        };
                        myChart.setOption(option);
                    }
                });
            }
        }
    });
    app.newProblem();

    var myChart = echarts.init(document.getElementById('main'));

});

