/**
 * Created with IntelliJ IDEA.
 * User: nicloay
 * Date: 18/5/12
 * Time: 10:17 PM
 * To change this template use File | Settings | File Templates.
 */
package com.nicloay.behaviours {
import com.nicloay.behaviours.Event.DuplicateCreatedEvent;
import com.nicloay.behaviours.Event.DuplicateCreatedEvent;

import flashx.textLayout.events.DamageEvent;

import mx.core.Container;

import mx.core.UIComponent;

import mx.core.UIComponent;
import mx.events.DragEvent;

import spark.components.Panel;

public class DuplicateInSourceOnDrop extends AbstractBehaviour{
    private var parentPanel:Panel;

    public function DuplicateInSourceOnDrop(target:UIComponent,parentPanel:Panel) {
        super(target);
        this.parentPanel=parentPanel;
        init();

    }
    private function init():void {
        target.addEventListener(DragEvent.DRAG_COMPLETE,dragCompleteHandler);

    }

    private function dragCompleteHandler(event:DragEvent):void {
        var newElement:UIComponent = new targetClass();
        parentPanel.addElement(newElement);
        target.dispatchEvent(new DuplicateCreatedEvent(DuplicateCreatedEvent.ON_DUPLICATE_CREATED,newElement));
    }

    public function destroy():void{
        target.removeEventListener(DragEvent.DRAG_COMPLETE,dragCompleteHandler);
    }

}
}
