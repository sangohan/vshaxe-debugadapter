package fdbAdapter.commands;

import vshaxeDebug.Context;
import vshaxeDebug.DebuggerCommand;
import protocol.debug.Types.StopReason;
import protocol.debug.Types.PauseResponse;


class Pause extends DebuggerCommand {

    var response:PauseResponse;

    public function new(context:Context, response:PauseResponse) {
        super(context);
        this.response = response;
    }
    
    override function execute() {
        debugger.send("");
        debugger.send("y");
    }

    override public function processDebuggerOutput(lines:Array<String>) {
        setDone();
        protocol.sendResponse(response);
        context.onEvent(Stop(StopReason.pause));
    }
}
