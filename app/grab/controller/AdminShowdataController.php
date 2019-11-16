<?php
namespace app\grab\controller;
use cmf\controller\AdminBaseController;
use app\facade\Connectother as con;
use think\facade\Cache;

/**
 * Class AdminShowdataController   页面展示数据    2019年10月10日11:10:37
 * @package app\grab\controller
 */
class AdminShowdataController extends AdminBaseController
{

    public function showdata()
    {
        $url = con::urls();
        $this->assign('url',$url);
        return $this->fetch();
    }

    /**
     *主页展示请求数据
     */
    public function showdata_index(){

        $data = input('param.');
        $time = time()-86400;
		$time2 = time()-10800;
        //缓存总条数
        $count = con::con('allshow')->where('time','>=',$time)->limit('5000')->cache('key',60)->count();

        //判断是否缓存
//        if(!Cache::get('wx_alldata')){
//
//            $wxdata1 = con::con('allshow')->order('id desc')->select();
//
//            Cache::tag('wx_all')->set('wx_alldata',$wxdata1);
//        }else{
//            $wx_alldata = Cache::get('wx_alldata');
//        }
        $alldata = con::con('allshow')
                ->where('time','>=',$time)
                ->order('id desc')
                ->page($data['page'],$data['limit'])
                ->select();

        $wxdata = con::con('wxshow')
                ->where('wtime','>=',$time2)
                ->limit('50000')
                ->cache(60)
                ->select();
        $allwx = $alldata;
        $wx = $wxdata;

        foreach ($allwx as $key => $value) {
           foreach ($wx as $k => $v) {
             if($value['user_ip']==$v['wuser_ip']){
                $stop=$value['time']-$v['wtime'];
                if($stop>900){
                    unset($wx[$k]);
                    continue;
                }else{
                    $alldata[$key]['stop'] = $stop;
                    unset($allwx[$key]);
                    unset($wx[$k]);
                }
                
             }
           }

           if(!isset($alldata[$key]['stop'])||$alldata[$key]['stop'] <=0 ){
                $alldata[$key]['stop']="--";
           }

        }
        //查询指定条数，实现翻页功能
//        $wxdata = array_slice($wx_alldata,$data['page']*$data['limit'],($data['limit']-1),true);

        //将时间戳转换为时间
        foreach ($alldata as $key => $value) {
           $alldata[$key]['time']=date('Y-m-d H:i:s',$value['time']);

        }


        return con::msg(0,'ok',($count),$alldata);


    }


}
