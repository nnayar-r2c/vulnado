public class ActiveDebugCode{

    public void bad(){
        StackTraceElement[] elements;

        Exception e = new Exception();
        elements = e.getStackTrace();

        // ruleid: active-debug-code-getstacktrace
        System.err.print(elements);
    }
    
    public void bad2(){
        StackTraceElement[] elements;

        Exception e = new Exception();
        elements = e.getStackTrace();

        // ruleid: active-debug-code-getstacktrace
        System.err.print(elements);
    }

    public void bad21(){
        StackTraceElement[] elements21;

        Exception e = new Exception();
        elements21 = e.getStackTrace();

        // ruleid: active-debug-code-getstacktrace
        System.err.print(elements21);
    }

    public void bad212(){
        StackTraceElement[] elements212;

        Exception e = new Exception();
        elements212 = e.getStackTrace();

        // ruleid: active-debug-code-getstacktrace
        System.err.print(elements212);
    }

    public void bad213(){
        StackTraceElement[] elements213;

        Exception e = new Exception();
        elements213 = e.getStackTrace();

        // ruleid: active-debug-code-getstacktrace
        System.err.print(elements213);
    }

}