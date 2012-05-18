/**
 * Created with IntelliJ IDEA.
 * User: nicloay
 * Date: 18/5/12
 * Time: 9:48 PM
 * To change this template use File | Settings | File Templates.
 */
package com.nicloay.behaviours {
import flash.display.DisplayObject;
import flash.events.MouseEvent;
import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;

import mx.core.IUIComponent;
import mx.core.UIComponent;
import mx.events.DragEvent;
import mx.events.MenuEvent;
import mx.managers.DragManager;

public class DraggableWithProxyBehaviour extends AbstractBehaviour{

    public function DraggableWithProxyBehaviour(target:UIComponent) {
        super(target);
        init();
    }

    private function init():void {
        target.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
    }


    private function mouseDownHandler(event:MouseEvent):void {
        var dragProxy=new targetClass();
        dragProxy.width=target.width;
        dragProxy.height=target.height;

        dragProxy.alpha=0.2;
        DragManager.doDrag(event.currentTarget as IUIComponent,null,event,dragProxy);

    }

    private function destroy(){
        target.removeEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
    }
}
}
