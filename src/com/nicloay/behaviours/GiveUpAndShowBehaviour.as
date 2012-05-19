/**
 * Created with IntelliJ IDEA.
 * User: nicloay
 * Date: 18/5/12
 * Time: 11:27 PM
 * To change this template use File | Settings | File Templates.
 */
package com.nicloay.behaviours {


import com.nicloay.behaviours.Event.GiveUpDropComplete;
import com.nicloay.behaviours.Event.GiveUpDropComplete;

import mx.core.UIComponent;
import mx.events.DragEvent;
import mx.managers.DragManager;

import spark.components.SkinnableContainer;


public class GiveUpAndShowBehaviour extends AbstractBehaviour {
    private var parentContainer:SkinnableContainer;
    private var originalX:int;
    private var originalY:int;
    private var originalWidth:int;
    private var originalHeight:int;
    public var GAP=10;
    private var shadow:*;

    public function GiveUpAndShowBehaviour(target:UIComponent,parentContainer:SkinnableContainer) {
        super(target);
        this.parentContainer=parentContainer;
        init();

    }
    private function init():void {
        target.addEventListener(DragEvent.DRAG_ENTER,dragEnterHandler);
        target.addEventListener(DragEvent.DRAG_OVER,dragOverHandler);
    }

    private function dragExitHandler(event:DragEvent):void {
        target.x = originalX;
        target.width=originalWidth;
        destroyShadow();
    }

    private function destroyShadow():void {
        parentContainer.removeElement(shadow);
        shadow = null;
    }

    private function dragEnterHandler(event:DragEvent):void {
        DragManager.acceptDragDrop(target);
        originalHeight=target.height;
        originalWidth=target.width;
        originalX=target.x;
        originalY=target.y;
    }

    private function dragOverHandler(event:DragEvent):void {


        var newWidth:int=(originalWidth-GAP)/2;
        var currentMouseX=target.mouseX;
        if (currentMouseX>=newWidth && currentMouseX<=(newWidth+GAP)){
            return;
        }



        if (shadow == null){
            shadow = new targetClass();
            shadow.alpha = 0.1;
            shadow.y = originalY;
            shadow.addEventListener(DragEvent.DRAG_EXIT,dragExitHandler);
            shadow.addEventListener(DragEvent.DRAG_ENTER,shadowDragEnterHandler);
            shadow.addEventListener(DragEvent.DRAG_DROP,shadowDragDropHandler);
            parentContainer.addElement(shadow);
        }



        if (currentMouseX<newWidth){
            target.x = originalX+newWidth+GAP;

            shadow.x = originalX;
        } else {
            shadow.x = originalX+newWidth+GAP;
            target.x = originalX;
        }
        target.width=newWidth;
        shadow.width = newWidth;


    }

    private function shadowDragDropHandler(event:DragEvent):void {

        var dragInitiator=event.dragInitiator;
        dragInitiator.x = shadow.x;
        dragInitiator.y = shadow.y;
        dragInitiator.width=shadow.width;
        dragInitiator.height=shadow.height;
        target.dispatchEvent(new GiveUpDropComplete(GiveUpDropComplete.ON_GIVE_UP_DROP_COMPLETE,dragInitiator));
        destroyShadow();
    }

    private function shadowDragEnterHandler(event:DragEvent):void {
        DragManager.acceptDragDrop(shadow);
    }
}
}
