/**
 * Created with IntelliJ IDEA.
 * User: nicloay
 * Date: 18/5/12
 * Time: 11:27 PM
 * To change this template use File | Settings | File Templates.
 */
package com.nicloay.behaviours {
import flash.display.DisplayObject;

import mx.core.Container;
import mx.core.UIComponent;
import mx.core.UIComponent;
import mx.events.DragEvent;
import mx.managers.DragManager;

import spark.components.Panel;

public class GiveUpAndShowBehaviour extends AbstractBehaviour {
    private var parentContainer:UIComponent;
    private var originalX:int;
    private var originalY:int;
    private var originalWidth:int;
    private var originalHeight:int;
    public var GAP=10;

    public function GiveUpAndShowBehaviour(target:UIComponent,parentContainer:UIComponent) {
        super(target);
        this.parentContainer=parentContainer;
        init();

    }
    private function init():void {
        target.addEventListener(DragEvent.DRAG_OVER,dragOverHandler);
        target.addEventListener(DragEvent.DRAG_ENTER,draEnterHandler);

    }

    private function draEnterHandler(event:DragEvent):void {
        DragManager.acceptDragDrop(event.currentTarget as UIComponent);
        originalHeight=target.height;
        originalWidth=target.width;
        originalX=target.x;
        originalY=target.y;
    }

    private function dragOverHandler(event:DragEvent):void {
        target.width=(originalWidth-GAP)/2;
        if (event.localX<=target.width){
            target.x = originalX+target.width+GAP;
        }
    }
}
}
