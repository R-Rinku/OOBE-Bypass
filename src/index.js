import setupScript from "../scripts/setup.cmd";
import firstLoginScript from "../scripts/first-login.ps1";

const textHeaders = {
  "content-type": "text/plain; charset=utf-8",
  "cache-control": "no-store"
};

export default {
  fetch(request) {
    const { pathname } = new URL(request.url);

    if (pathname === "/" || pathname === "/skip.cmd") {
      return new Response(setupScript, { headers: textHeaders });
    }

    if (pathname === "/first-login.ps1") {
      return new Response(firstLoginScript, { headers: textHeaders });
    }

    return new Response("Not found\n", { status: 404, headers: textHeaders });
  }
};

