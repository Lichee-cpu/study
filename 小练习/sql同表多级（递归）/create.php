<!DOCTYPE html>
<html lang="en">
<head>

<link rel="stylesheet" href="{__STATIC_PATH}plug/layui/css/layui.css">
<script src="{__STATIC_PATH}plug/layui/layui.js"></script>
<script src="{__STATIC_PATH}plug/layui/xm-select.js"></script>
</head>

<body>
<div class="layui-form-item">
    <label class="layui-form-label">场景标签</label>
    <div id="label" name="label"  class="xm-select-demo layui-input-block"></div>
    <script>
        var label = JSON.parse('{$label}'.replace(/&quot;/g, '"'))
        var arr=[]
        console.log(label)
        for(let key in label){
            // console.log(label[key].label_name)
            name0 = label[key].label_name
            value0 = key
            con = {name: name0, value: value0,  children: []}
            for(let k in label[key].res){
                name = label[key].res[k].label_name
                value = label[key].res[k].label_id
                con.children[k] = {name: name, value: value,}
            }
            arr[key] = con
        }
        console.log(arr)

        var demolabel = xmSelect.render({
            el: '#label',
            language: 'zn',
            filterable:true,
            height:300 ,
            cascader: {
                //是否显示级联模式
                show: true,
                //间距
                indent: 200,
                //是否严格遵守父子模式
                strict: true,
            },
            data(){
                return arr
            }
        })
    </script>
</body>
</div>