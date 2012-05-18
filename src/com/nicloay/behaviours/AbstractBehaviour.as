/**
 * Created with IntelliJ IDEA.
 * User: nicloay
 * Date: 18/5/12
 * Time: 9:46 PM
 * To change this template use File | Settings | File Templates.
 */
package com.nicloay.behaviours {
import flash.display.DisplayObject;
import flash.events.EventDispatcher;
import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;

import mx.core.UIComponent;

public class AbstractBehaviour{
    protected var target:UIComponent;
    protected var targetClass:Class;

    public function AbstractBehaviour(target:UIComponent) {
        this.target=target;
        var className:String = getQualifiedClassName(target);
        targetClass = getDefinitionByName(className) as Class;
    }
}
}
