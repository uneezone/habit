package com.habit;

import com.habit.Interceptor.LoginCheckInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

   @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginCheckInterceptor())
                .order(1)
                .addPathPatterns("/**")
                .excludePathPatterns(
                        "/","/category/**","/category","/login","/logout.do","/findMember","/resultFindId","/resultFind"
                        ,"/findid.do","/css/*","/js/*","/img/*","/products/reviews","/search/**","/storage/*","/newMember","/idCheck","/welcome.do","/findid/**","/findpw/**"
                        ,"/error"
                );
    }
}
