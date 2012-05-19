/**
 * Created with IntelliJ IDEA.
 * User: nicloay
 * Date: 19/5/12
 * Time: 10:20 PM
 * To change this template use File | Settings | File Templates.
 */
package com.nicloay.behaviours.Event {
import flash.events.Event;

import mx.core.IUIComponent;

public class GiveUpDropComplete extends Event{
    public static const ON_GIVE_UP_DROP_COMPLETE="onGiveUpDropComplete";
    public var x:int;
    public var y:int;
    public var width:int;
    public var height:int;
    public var dragInitiator:IUIComponent;
    public function GiveUpDropComplete(type:String, dragInitiator:IUIComponent) {
        this.dragInitiator=dragInitiator;
        super(type);
    }
}
}
