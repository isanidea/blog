<?php

namespace app\common\controller;
use think\Controller;
use think\Db;

class Base extends controller{

    public $controller;
    public $action;
    public $configArr = [];

    public function _initialize() {
        // parent::_initialize();
        //读取配置
        $this->configArr = Db::name("Config")->where("status>0")->column("value","name");
        $this->assign("configArr",$this->configArr);
        $this->controller = request()->controller();
        $this->action = request()->action();
    }

    public function json_return($result=0,$msg="操作成功",$fileName="dataError"){

    }

}
