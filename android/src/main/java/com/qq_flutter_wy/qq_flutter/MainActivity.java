package com.Tecent.TecentYule;
 
import org.json.JSONObject;
 
import com.tencent.connect.common.Constants;
import com.tencent.tauth.IUiListener;
import com.tencent.tauth.Tencent;
import com.tencent.tauth.UiError;
import com.unity3d.player.UnityPlayerActivity;
 
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.Menu;
import android.view.MenuItem;
 
public class MainActivity extends UnityPlayerActivity {
	
	public static Tencent mTencent;
    public SharedPreferences sharedPrefrences;
    public Editor editor;
    public Context context; 
    @Override
    protected void onCreate(Bundle savedInstanceState) {
 
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_main);
    }
    //登录方法
   public void LoginAndSend()
   {//定义一个对象，里面的第一个参数是自己在QQ开放平台上申请的APPID。
       mTencent = Tencent.createInstance("100371282",this.getApplicationContext());     
            if (!mTencent.isSessionValid())
            {       
               mTencent.login(this, "all", loginListener);
            }           
   }
   IUiListener loginListener = new BaseUiListener() {
       @Override
       protected void doComplete(JSONObject values) {
           initOpenidAndToken(values);           
       }
   };
   public static void initOpenidAndToken(JSONObject jsonObject) {
       try {
           String token = jsonObject.getString(Constants.PARAM_ACCESS_TOKEN);
           String expires = jsonObject.getString(Constants.PARAM_EXPIRES_IN);
           String openId = jsonObject.getString(Constants.PARAM_OPEN_ID);
           if (!TextUtils.isEmpty(token) && !TextUtils.isEmpty(expires)
                   && !TextUtils.isEmpty(openId)) {
               mTencent.setAccessToken(token, expires);
               mTencent.setOpenId(openId);
           }
       } catch(Exception e) {
       }
   }
 
 
 
@Override  //这段代码非常重要，不加的话无法获取回调
protected void onActivityResult(int requestCode, int resultCode, Intent data) {    
   if (requestCode == Constants.REQUEST_LOGIN ||
    requestCode == Constants.REQUEST_APPBAR) {
    Tencent.onActivityResultData(requestCode,resultCode,data,loginListener);
   }
   super.onActivityResult(requestCode, resultCode, data);
}
 
private class BaseUiListener implements IUiListener {
 
    @Override
    public void onComplete(Object response) {
        if (null == response) {
 
            return;
        }
        JSONObject jsonResponse = (JSONObject) response;
        if (null != jsonResponse && jsonResponse.length() == 0) {
 
            return;
        }
 
        doComplete((JSONObject) response);
    }
 
    protected void doComplete(JSONObject values) {
 
    }
 
    @Override
    public void onError(UiError e) {
 
    }
 
    @Override
    public void onCancel() {
 
    }
 }
}