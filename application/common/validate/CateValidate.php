<?php

namespace app\common\validate;

use app\common\validate\Validate;

class CateValidate extends Validate
{

    /**
     * @var array
     */
    protected $rule = [
    ];

    /**
     * @var array
     */
    protected $message = [
    ];

    /**
     * @var array
     */
    protected $scene = [
        'create'   =>  [],
        'createBrand'   =>  [],
        'createSeries'   =>  [],
        'createCar'   =>  [],
        'update'  =>  [],
        'save'  =>  [],
        'not'  =>  [],
    ];

}