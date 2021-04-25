//方案一for循环
$label = SceneLabel::where('pid','=',0)->select()->toArray();
$label_all =SceneLabel::where('pid','<>',0)->select()->toArray();
$arr = array();

foreach ($label as $id){
    $id['res'] = array();

    foreach ($label_all as $pid){
        if($pid['pid'] == $id['label_id']){
            $id['res'] = array_merge($id['res'],array($pid));
        }
    }
    $arr = array_merge($arr,array($id));
}
return View::fetch('create',['label'=>json_encode($arr)]);