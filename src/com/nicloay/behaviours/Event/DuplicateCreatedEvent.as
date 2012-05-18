/**
 * Created with IntelliJ IDEA.
 * User: nicloay
 * Date: 19/5/12
 * Time: 12:03 AM
 * To change this template use File | Settings | File Templates.
 */
package com.nicloay.behaviours.Event {
import flash.events.Event;

import mx.core.UIComponent;

public class DuplicateCreatedEvent extends Event{
    public static const ON_DUPLICATE_CREATED:String="onDuplicateCreated";
    public var newElement:UIComponent;
    public function DuplicateCreatedEvent(type:String, newElement:UIComponent) {
        this.newElement=newElement;
        super(type);
    }
}
}
