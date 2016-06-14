#! /usr/bin/env julia

pkg_dir = dirname(dirname(@__FILE__))

@windows_only begin
    try
        run(`where cl.exe`)
    catch
        error("Could not find cl.exe.")
    end

    try
        run(`where vcvarsall.bat`)
    catch
        error("Could not find vcvarsall.bat.")
    end

    # Move compilation into a batch file so we can setup environment variables.
    run(`win.bat`)
end

@unix_only begin
    cd("$(pkg_dir)/src") do
        # Note: on Mac OS X, g++ is aliased to clang++.
        run(`g++ -c -fPIC -std=c++11 clipper.cpp cclipper.cpp`)
        run(`g++ -shared -o cclipper.so clipper.o cclipper.o`)
    end
end
