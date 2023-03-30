/*
 * This file is auto-generated.  DO NOT MODIFY.
 */
package id.flutter.flutter_background_service;
// Declare any non-default types here with import statements

public interface IBackgroundServiceBinder extends android.os.IInterface
{
  /** Default implementation for IBackgroundServiceBinder. */
  public static class Default implements id.flutter.flutter_background_service.IBackgroundServiceBinder
  {
    @Override public void bind(int id, id.flutter.flutter_background_service.IBackgroundService service) throws android.os.RemoteException
    {
    }
    @Override public void unbind(int id) throws android.os.RemoteException
    {
    }
    @Override public void invoke(java.lang.String data) throws android.os.RemoteException
    {
    }
    @Override
    public android.os.IBinder asBinder() {
      return null;
    }
  }
  /** Local-side IPC implementation stub class. */
  public static abstract class Stub extends android.os.Binder implements id.flutter.flutter_background_service.IBackgroundServiceBinder
  {
    private static final java.lang.String DESCRIPTOR = "id.flutter.flutter_background_service.IBackgroundServiceBinder";
    /** Construct the stub at attach it to the interface. */
    public Stub()
    {
      this.attachInterface(this, DESCRIPTOR);
    }
    /**
     * Cast an IBinder object into an id.flutter.flutter_background_service.IBackgroundServiceBinder interface,
     * generating a proxy if needed.
     */
    public static id.flutter.flutter_background_service.IBackgroundServiceBinder asInterface(android.os.IBinder obj)
    {
      if ((obj==null)) {
        return null;
      }
      android.os.IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
      if (((iin!=null)&&(iin instanceof id.flutter.flutter_background_service.IBackgroundServiceBinder))) {
        return ((id.flutter.flutter_background_service.IBackgroundServiceBinder)iin);
      }
      return new id.flutter.flutter_background_service.IBackgroundServiceBinder.Stub.Proxy(obj);
    }
    @Override public android.os.IBinder asBinder()
    {
      return this;
    }
    @Override public boolean onTransact(int code, android.os.Parcel data, android.os.Parcel reply, int flags) throws android.os.RemoteException
    {
      java.lang.String descriptor = DESCRIPTOR;
      switch (code)
      {
        case INTERFACE_TRANSACTION:
        {
          reply.writeString(descriptor);
          return true;
        }
        case TRANSACTION_bind:
        {
          data.enforceInterface(descriptor);
          int _arg0;
          _arg0 = data.readInt();
          id.flutter.flutter_background_service.IBackgroundService _arg1;
          _arg1 = id.flutter.flutter_background_service.IBackgroundService.Stub.asInterface(data.readStrongBinder());
          this.bind(_arg0, _arg1);
          reply.writeNoException();
          return true;
        }
        case TRANSACTION_unbind:
        {
          data.enforceInterface(descriptor);
          int _arg0;
          _arg0 = data.readInt();
          this.unbind(_arg0);
          reply.writeNoException();
          return true;
        }
        case TRANSACTION_invoke:
        {
          data.enforceInterface(descriptor);
          java.lang.String _arg0;
          _arg0 = data.readString();
          this.invoke(_arg0);
          reply.writeNoException();
          return true;
        }
        default:
        {
          return super.onTransact(code, data, reply, flags);
        }
      }
    }
    private static class Proxy implements id.flutter.flutter_background_service.IBackgroundServiceBinder
    {
      private android.os.IBinder mRemote;
      Proxy(android.os.IBinder remote)
      {
        mRemote = remote;
      }
      @Override public android.os.IBinder asBinder()
      {
        return mRemote;
      }
      public java.lang.String getInterfaceDescriptor()
      {
        return DESCRIPTOR;
      }
      @Override public void bind(int id, id.flutter.flutter_background_service.IBackgroundService service) throws android.os.RemoteException
      {
        android.os.Parcel _data = android.os.Parcel.obtain();
        android.os.Parcel _reply = android.os.Parcel.obtain();
        try {
          _data.writeInterfaceToken(DESCRIPTOR);
          _data.writeInt(id);
          _data.writeStrongBinder((((service!=null))?(service.asBinder()):(null)));
          boolean _status = mRemote.transact(Stub.TRANSACTION_bind, _data, _reply, 0);
          if (!_status && getDefaultImpl() != null) {
            getDefaultImpl().bind(id, service);
            return;
          }
          _reply.readException();
        }
        finally {
          _reply.recycle();
          _data.recycle();
        }
      }
      @Override public void unbind(int id) throws android.os.RemoteException
      {
        android.os.Parcel _data = android.os.Parcel.obtain();
        android.os.Parcel _reply = android.os.Parcel.obtain();
        try {
          _data.writeInterfaceToken(DESCRIPTOR);
          _data.writeInt(id);
          boolean _status = mRemote.transact(Stub.TRANSACTION_unbind, _data, _reply, 0);
          if (!_status && getDefaultImpl() != null) {
            getDefaultImpl().unbind(id);
            return;
          }
          _reply.readException();
        }
        finally {
          _reply.recycle();
          _data.recycle();
        }
      }
      @Override public void invoke(java.lang.String data) throws android.os.RemoteException
      {
        android.os.Parcel _data = android.os.Parcel.obtain();
        android.os.Parcel _reply = android.os.Parcel.obtain();
        try {
          _data.writeInterfaceToken(DESCRIPTOR);
          _data.writeString(data);
          boolean _status = mRemote.transact(Stub.TRANSACTION_invoke, _data, _reply, 0);
          if (!_status && getDefaultImpl() != null) {
            getDefaultImpl().invoke(data);
            return;
          }
          _reply.readException();
        }
        finally {
          _reply.recycle();
          _data.recycle();
        }
      }
      public static id.flutter.flutter_background_service.IBackgroundServiceBinder sDefaultImpl;
    }
    static final int TRANSACTION_bind = (android.os.IBinder.FIRST_CALL_TRANSACTION + 0);
    static final int TRANSACTION_unbind = (android.os.IBinder.FIRST_CALL_TRANSACTION + 1);
    static final int TRANSACTION_invoke = (android.os.IBinder.FIRST_CALL_TRANSACTION + 2);
    public static boolean setDefaultImpl(id.flutter.flutter_background_service.IBackgroundServiceBinder impl) {
      // Only one user of this interface can use this function
      // at a time. This is a heuristic to detect if two different
      // users in the same process use this function.
      if (Stub.Proxy.sDefaultImpl != null) {
        throw new IllegalStateException("setDefaultImpl() called twice");
      }
      if (impl != null) {
        Stub.Proxy.sDefaultImpl = impl;
        return true;
      }
      return false;
    }
    public static id.flutter.flutter_background_service.IBackgroundServiceBinder getDefaultImpl() {
      return Stub.Proxy.sDefaultImpl;
    }
  }
  public void bind(int id, id.flutter.flutter_background_service.IBackgroundService service) throws android.os.RemoteException;
  public void unbind(int id) throws android.os.RemoteException;
  public void invoke(java.lang.String data) throws android.os.RemoteException;
}
