package com.nightfarmer.cloudapp.update;

/**
 * Created by zhangfan on 16-8-11.
 */
public class FileInfo {
    public String version;
    public String name;

    @Override
    public boolean equals(Object o) {
        return hashCode() == o.hashCode();
    }

    @Override
    public int hashCode() {
        return (name + version).hashCode();
    }
}
